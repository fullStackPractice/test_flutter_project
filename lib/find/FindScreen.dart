import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vscode_flutter/find/Company.dart';
import 'package:vscode_flutter/find/CompanyItem.dart';
import 'package:vscode_flutter/mine/SecondScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

// 暗号: 原来还可以这么玩
class FindScreen extends StatefulWidget {
  FindScreen({Key key}) : super(key: key);

  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  List<Company> _companies = [];
  int page = 0; // 第一页

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getCompanyList2();
  }

  // http://m.app.haosou.com/index/getData?type=1&page=1
  getCompanyList2() async {
    page++;
    String url = 'http://m.app.haosou.com/index/getData?type=1&page=$page';
    var response = await http.get(url);
    var data = response.body;
    var map = jsonDecode(data);
    setState(() {
      // _companies.addAll(map)
      _companies = Company.fromMapData(map);
    });
  }

  _buildContent() {
    if (_companies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
          refreshingText: '正在加载中...',
          idleText: '下拉刷新',
          completeText: '加载完成',
          failedText: '数据刷新异常',
          releaseText: '松开刷新'),
      footer: ClassicFooter(
          idleText: '加载更多数据', loadingText: '玩命加载中...', noDataText: '没有更多数据'),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      controller: _refreshController,
      child: ListView.builder(
          itemCount: _companies.length,
          itemBuilder: (context, index) {
            // Company company = _companies[index];
            // return CompanyItem(company);
            var model = _companies[index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SecondScreen(
                                content: '暗号：原来还可以这么玩 $model',
                              )));
                  // Navigator.of(context).pushNamed('/second').then((value) {
                  //   print(value);
                  // });
                },
                child: CompanyItem(model));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('发现'),
        ),
        body: _buildContent());
  }

  _onRefresh() async {
    page = 0;
    _companies.clear();
    await getCompanyList2();
    _refreshController.refreshCompleted();
  }

  _onLoading() async {
    await getCompanyList2();
    _refreshController.loadComplete();
  }
}

// class FindScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text('发现'),
//       ),
//       body: Center(
//         child: Text('发现'),
//       ),
//     );
//   }
// }
