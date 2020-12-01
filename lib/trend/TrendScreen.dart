import 'package:flutter/material.dart';
import 'package:vscode_flutter/trend/BorwseScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrendScreen extends StatelessWidget {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('动态'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('存储数据'),
                onPressed: () async {
                  SharedPreferences pref = await _preferences;
                  pref.setString('someThingKey', '这是我存储的数据');
                }),
            RaisedButton(
                child: Text('读取数据'),
                onPressed: () async {
                  SharedPreferences pref = await _preferences;
                  //dynamic
                  String data = pref.get('someThingKey');
                  print('data:$data');
                }),
            RaisedButton(
                child: Text('webview'),
                onPressed: () async {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => BrowserScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
