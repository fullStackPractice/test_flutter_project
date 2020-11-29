import 'package:flutter/material.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('动态'),
      ),
      body: Center(
        child: Text(
          '动态',
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
