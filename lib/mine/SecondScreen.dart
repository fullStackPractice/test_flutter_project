
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  
  final String content;

  SecondScreen({this.content});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('二级页面'), 
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '入参是${this.content != null ? this.content:""}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue 
              ), 
            ),
            RaisedButton(
                child: Text('返回1'),
                onPressed: (){
                  Navigator.of(context).pop('返回的数据');
                  // Navigator.of(context).popUntil((route) => false)
                }
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).popAndPushNamed('/third');

              }, 
              child: Text('返回2'),
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/third');
              }, 
              child: Text('返回3'),
            )
          ],
        ), 
      ),
    );
  }
}