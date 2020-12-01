import 'package:flutter/material.dart';
import 'package:vscode_flutter/mine/SecondScreen.dart';

class NavigationTask extends StatelessWidget {
  const NavigationTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('导航跳转'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('静态跳转'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second')
                      .then((value) => {print(value)});
                }),
            RaisedButton(
                child: Text('动态跳转'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen('content')));
                })
          ],
        ),
      ),
    );
  }
}
