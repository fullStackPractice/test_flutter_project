import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final String content;
  CustomScreen(this.title, {this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/owl.jpg',
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3457343279,3072766965&fm=26&gp=0.jpg',
                width: 120,
                height: 120,
                // fit: BoxFit.cover,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3457343279,3072766965&fm=26&gp=0.jpg'),
                radius: 90,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                // alignment: Alignment.centerRight,
                alignment: Alignment(0.5, 0.5),
                color: Colors.red,
                width: 150,
                height: 150,
                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50)
                child: Text(
                  'data',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  // margin: EdgeInsets.only(top: 20),
                  color: Colors.blue,
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(height: 20),
              Container(
                  // margin: EdgeInsets.only(top: 20),
                  color: Colors.orange,
                  width: 90,
                  height: 90,
              )
            ],
          ),
        ],
      ),
    );
  }
}
