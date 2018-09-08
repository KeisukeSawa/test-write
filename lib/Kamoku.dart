
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_write/CommonUtil.dart';
import 'package:test_write/EditKamoku.dart';

// FireBaseへの送信を行うメソッド
class ExamEntry {
  String key;
  DateTime date;
  String message;

  ExamEntry(this.date, this.message);

  ExamEntry.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        date = new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
        message = snapshot.value["message"];

  // Json形式で送信する。
  toJson() {
    return {
      "date": date.millisecondsSinceEpoch,
      "message": message,
    };
  }
}


class ExamEditer extends StatefulWidget {

  static String path;

  static String syousai;

  ExamEditer(String code) {
    path = CommonUtil.CreatePath(code);
    syousai = CommonUtil.CreateSyousai(code);
  }

  static examPath(){

    return path;

  }

  static re_Syousai(){

    return syousai;

  }


  @override
  _ExamEditerState createState() => new _ExamEditerState();
}

class _ExamEditerState extends State<ExamEditer> {

  // FireBaseのどのインスタンスのものなのか
  final _mainReference = FirebaseDatabase.instance.reference().child(ExamEditer.examPath());

  final _textEditController = TextEditingController();

  List<ExamEntry> entries = new List(); // チャットのメッセージリスト

  @override
  initState() {
    super.initState();
    _mainReference.onChildAdded.listen(_onExamAdded);
    _mainReference.onChildChanged.listen(_onEntryEdited);
  }

  _onExamAdded(Event e) {
    setState(() {
      entries.add(new ExamEntry.fromSnapShot(e.snapshot));
    });
  }

  _onEntryEdited(Event e) {
    var oldValue = entries.singleWhere((entry) => entry.key == e.snapshot.key);
    setState(() {
      entries[entries.indexOf(oldValue)] = new ExamEntry.fromSnapShot(e.snapshot);
    });
  }

  // 画面全体のビルド
  @override
  Widget build(BuildContext context) {

    String kamokumei = ExamEditer.examPath().substring(16);

    return Scaffold(
      appBar: AppBar(
          title: new Text(kamokumei + "の試験範囲")
      ),
      body: Container(
          child: new Column(
            children: <Widget>[
              ListTile(
                title: Text('科目詳細'),
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildDialog(context),
                  );
                },
              ),
              Expanded(

                child:
                ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildRow(index);
                  },
                  itemCount: entries.length,

                ),
              ),
              Divider(height: 6.0,),
              Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: _buildInputArea()
              )
            ],
          )
      ),
    );
  }

  // 投稿されたメッセージの1行を表示するWidgetを生成
  Widget _buildRow(int index) {
    return Card(
        child: ListTile(
            title: Text(entries[index].message),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditKamoku(index,ExamEditer.examPath())),
              );
            }
        )
    );
  }

  // 投稿メッセージの入力部分のWidgetを生成
  Widget _buildInputArea() {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0,),
        Expanded(
          child: TextField(
            controller: _textEditController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '情報を入力してください'
            ),
          ),
        ),
        CupertinoButton(
          child: Text("投稿"),
          onPressed: () {
            _mainReference.push().set(ExamEntry(DateTime.now(), _textEditController.text).toJson());
            _textEditController.clear();
            // キーボードを閉じる
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        )
      ],
    );
  }

  Widget _buildDialog(BuildContext context) {

    String kamokumei = ExamEditer.examPath().substring(16);

    return new AlertDialog(
      title: new Text(kamokumei),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          // _buildLogoAttribution(),

        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {

    String syousai = ExamEditer.re_Syousai();

    return new RichText(
      text: new TextSpan(
        text: syousai,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}