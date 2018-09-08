
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// FireBaseへの送信を行うメソッド
class ExamEntry {
  String key;
  DateTime date;
  String message;

  ExamEntry(this.date,this.message);

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


class EditKamoku extends StatefulWidget {

  static String kamokupath;

  static int data_index;

  EditKamoku(int index, String path) {
    kamokupath = path;
    data_index = index;
  }


  static examPath(){

    return kamokupath;

  }

  static dataIndex(){

    return data_index;

  }


  @override
  _ExamEditerState createState() => new _ExamEditerState();
}

class _ExamEditerState extends State<EditKamoku> {

  // FireBaseのどのインスタンスのものなのか
  final _mainReference = FirebaseDatabase.instance.reference().child(EditKamoku.examPath());

  final _textEditController = TextEditingController();

  List<ExamEntry> entries = new List(); // チャットのメッセージリスト

  int entryIndex = EditKamoku.dataIndex();


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

    String kamokumei = EditKamoku.examPath().substring(16);
    int entryIndex = EditKamoku.dataIndex();

    return Scaffold(
      appBar: AppBar(
          title: new Text(kamokumei + "の試験範囲（編集）")
      ),
      body: Container(
          child: new Column(
            children: <Widget>[
              Expanded(
                child:
                ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildRow(entryIndex);
                  },
                  itemCount: 1,
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

    }
        )
    );
  }

  // 投稿メッセージの入力部分のWidgetを生成
  Widget _buildInputArea() {

    int entryIndex = EditKamoku.dataIndex();

    return Row(
      children: <Widget>[
        SizedBox(width: 16.0,),
        Expanded(
          child: TextField(
            controller: _textEditController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '変更内容を入力してください'
            ),
          ),
        ),
        CupertinoButton(
          child: Text("編集"),
          onPressed: () {
            _mainReference.child(entries[entryIndex].key).set(ExamEntry(DateTime.now(),_textEditController.text,).toJson());
            _textEditController.clear();
            // キーボードを閉じる
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}