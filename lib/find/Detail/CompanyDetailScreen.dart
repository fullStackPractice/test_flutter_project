import 'package:flutter/material.dart';
import 'package:vscode_flutter/find/Company.dart';
import 'package:vscode_flutter/find/Detail/Company_info.dart';
import 'package:vscode_flutter/find/Detail/DotsIndicator.dart';
import 'package:vscode_flutter/find/Detail/company_hot_job.dart';
import 'package:vscode_flutter/find/Detail/company_inc.dart';

class CompanyDetailScreen extends StatefulWidget {
  final Company _company;
  CompanyDetailScreen(this._company);

  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen>
    with TickerProviderStateMixin {
  List<Widget> _imagesPages;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs;
  TabController _controller;
  VoidCallback onTapAction;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _imagesPages = [];
    _urls.forEach((url) {
      _imagesPages.add(new Container(
        color: Colors.black,
        child: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.network(
            url,
            height: 256.0,
            fit: BoxFit.cover,
          ),
        ),
      ));
    });

    _tabs = [
      Tab(text: '公司概况'),
      Tab(text: '热招职位'),
    ];

    _controller = new TabController(length: _tabs.length, vsync: this);
    onTapAction = () {
      setState(() {
        _currentIndex = _controller.index;
      });
    };
    _controller.addListener(onTapAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(256.0),
                  child: IndicatorViewPager(pages: _imagesPages),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CompanyInfo(widget._company),
                      Divider(
                        color: Colors.red,
                      ),
                      TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 16),
                        tabs: _tabs,
                        controller: _controller,
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3.0,
                      )
                    ],
                  ),
                ),
                IndexedStack(
                  index: _currentIndex,
                  children: <Widget>[
                    CompanyInc(widget._company.inc),
                    CompanyHotJob()
                  ],
                )
              ],
            ),
          ),
          new Positioned(
              left: 10, top: 30, child: BackButton(color: Colors.white))
        ],
      ),
    );
  }
}
