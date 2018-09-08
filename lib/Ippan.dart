import 'package:flutter/material.dart';
import 'package:test_write/Kamoku.dart';
import 'package:test_write/CommonUtil.dart';

// 一般科目のメニュー
class Ippan extends StatelessWidget {

  String _code;

  Ippan(String code){
    _code = code;
  }

  @override
  Widget build(BuildContext context) {

    String sikenName = CommonUtil.createSikenName(_code);
    String siken = sikenName.substring(0,10);

    return Scaffold(
      appBar: AppBar(
        title: Text(siken + "　一般科目"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('力学'),
            onTap: (){
              String ippan = "01";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('微分積分学Ⅰ'),
            onTap: (){
              String ippan = "02";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('ベクトル解析'),
            onTap: (){
              String ippan = "03";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('英会話'),
            onTap: (){
              String ippan = "04";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('総合英語演習Ⅰ'),
            onTap: (){
              String ippan = "05";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('応用解析学概論'),
            onTap: (){
              String ippan = "06";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('ドイツ語'),
            onTap: (){
              String ippan = "07";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('中国語'),
            onTap: (){
              String ippan = "08";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('科目選択画面に戻る'),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}