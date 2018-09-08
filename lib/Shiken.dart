import 'package:flutter/material.dart';
import 'package:test_write/Ippan.dart';
import 'package:test_write/Senmon.dart';
import 'package:test_write/CommonUtil.dart';

// 前期末試験のメニュー
class Shiken extends StatelessWidget {

  String _code;

  Shiken(String code){
    _code = code;
  }

  @override
  Widget build(BuildContext context) {

    String sikenName = CommonUtil.createSikenName(_code);
    String siken = sikenName.substring(0,10);

    return Scaffold(
      appBar: AppBar(
        title: Text(siken),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('一般科目'),
            onTap: (){
              String ippan = "1_";
              String newcode = "${_code}${ippan}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ippan(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('専門科目'),
            onTap: (){
              String senmon = "2_";
              String newcode = "${_code}${senmon}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Senmon(newcode)),
              );
            },
          ),
          ListTile(
            title: Text('試験選択画面に戻る'),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
