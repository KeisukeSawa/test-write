import 'package:flutter/material.dart';
import 'package:test_write/Kamoku.dart';
import 'package:test_write/CommonUtil.dart';

// 専門科目のメニュー
class Senmon extends StatelessWidget {

  String _code;

  Senmon(String code){
    _code = code;
  }

  @override
  Widget build(BuildContext context) {

    String sikenName = CommonUtil.createSikenName(_code);
    String siken = sikenName.substring(0,10);

    return Scaffold(
      appBar: AppBar(
        title: Text(siken + "　専門科目"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('フーリエ・ラプラス変換'),
            onTap: (){
              String senmon = "09";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('情報理論'),
            onTap: (){
              String senmon = "10";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('電磁気学'),
            onTap: (){
              String senmon = "11";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('情報通信工学'),
            onTap: (){
              String senmon = "12";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('ディジタル回路応用'),
            onTap: (){
              String senmon = "13";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('システムプログラミングⅡ'),
            onTap: (){
              String senmon = "14";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('コンピュータアーキテクチャ'),
            onTap: (){
              String senmon = "15";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('ソフトウェア工学'),
            onTap: (){
              String senmon = "16";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamEditer(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('データベース'),
            onTap: (){
              String senmon = "17";
              String newcode = "${_code}${senmon}";
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
