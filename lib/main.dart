import 'package:flutter/material.dart';
import 'package:test_write/Shiken.dart';

void main() {
  runApp(MaterialApp(
    // locale: Locale("ja","JP"),
    title: 'Test_write',
    home: Menu(),
  ));
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('テスト範囲共有エディタ'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('IE4_前期中間試験'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shiken("I4_1_")),
              );
            },
          ),
          ListTile(
            title: Text('IE4_前期末試験'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shiken("I4_2_")),
              );
            },
          ),
          ListTile(
            title: Text('IE4_後期中間試験'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shiken("I4_3_")),
              );
            },
          ),
          ListTile(
            title: Text('IE4_後期末試験'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shiken("I4_4_")),
              );
            },
          )
        ],
      ),
    );
  }
}
