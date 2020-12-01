import 'package:flutter/material.dart';
import 'package:vscode_flutter/find/CompanyItem.dart';
import 'package:vscode_flutter/find/Detail/CompanyDetailScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vscode_flutter/provider/company_list.dart';
import 'package:provider/provider.dart';

// 暗号: 江湖再见
class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

// 暗号: 江湖再见
class _FindScreenState extends State<FindScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    provider.refreshData();
  }

  _buildContent() {
    return Consumer<CompanyListProvider>(builder: (context, provider, _) {
      return IndexedStack(
        index: provider.showValue,
        children: <Widget>[
          new Center(
            child: CircularProgressIndicator(),
          ),
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(
              refreshingText: '正在加载中...',
              idleText: '下拉刷新',
              completeText: '加载完成',
              failedText: '数据刷新异常',
              releaseText: '松开刷新',
            ),
            footer: ClassicFooter(
                idleText: '加载更多数据',
                loadingText: '玩命加载中...',
                noDataText: '没有更多数据'),
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemBuilder: (context, index) {
                var model = provider.companyList[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => CompanyDetailScreen(model)));
                  },
                  child: CompanyItem(model),
                );
              },
              itemCount: provider.companyList.length,
            ),
          )
        ],
      );
    });
  }

  _onRefresh() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.refreshData();
    if (isSuccess) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  _onLoading() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.loadMoreData();
    if (isSuccess) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('发现'),
      ),
      body: _buildContent(),
    );
  }
}
