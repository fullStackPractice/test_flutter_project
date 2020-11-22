import 'package:flutter/material.dart';
import 'package:new_flutter_test/CunstomScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  //渲染界面
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

//---------------------------Scaffold讲解---------------------------
class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

// 暗号：初⻅Flutter
class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;
  List<Widget> _children = [
    CustomScreen('好友', content: '好友的内容'),
    CustomScreen('发现', content: '发现的内容'),
    CustomScreen('管理', content: '管理的内容'),
    CustomScreen('我的', content: '我的的内容'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTaped, // 点击选中的事件
          currentIndex: _currentIndex, //配置对应的索引值选中
          fixedColor: Colors.red, //选中的颜色
          type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
          items: [
            BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Image.asset(
                        'assets/imgs/invite_selected.png',
                        width: 20,
                        height: 20,
                      )
                    : Image.asset('assets/imgs/invite_normal.png',
                        width: 20, height: 20),
                title: Text('好友')),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? Image.asset(
                        'assets/imgs/discovery_selected.png',
                        width: 20,
                        height: 20,
                      )
                    : Image.asset('assets/imgs/discovery_normal.png',
                        width: 20, height: 20),
                title: Text('发现')),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? Image.asset(
                        'assets/imgs/manager_selected.png',
                        width: 20,
                        height: 20,
                      )
                    : Image.asset('assets/imgs/manager_normal.png',
                        width: 20, height: 20),
                title: Text('管理')),
            BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? Image.asset(
                        'assets/imgs/mine_selected.png',
                        width: 20,
                        height: 20,
                      )
                    : Image.asset('assets/imgs/mine_normal.png',
                        width: 20, height: 20),
                title: Text('我的')),
          ]),
    );
  }

  void onTabTaped(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex; // 改变状态
    });
  }
}
