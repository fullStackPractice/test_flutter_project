import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vscode_flutter/find/Company.dart';
import 'package:http/http.dart' as http;

class CompanyListProvider with ChangeNotifier {
  List<Company> _companyList = new List<Company>();
  int _currentPage = 1;
  int _showValue = 0;

  //获取list数据
  List<Company> get companyList => _companyList;

  //获取页数
  int get currentPage => _currentPage;

  //获取当前的显示状态
  int get showValue => _showValue;

  set companyList(List<Company> companyList) {
    _companyList = companyList;
    notifyListeners();
  }

  //网络加载
  int _type = 1;
  var url = 'http://m.app.haosou.com/index/getData?';
  refreshData() async {
    var httpURL = url + 'type=$_type&page=1';
    var response = await http.get(httpURL);
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      _companyList = Company.fromMapData(json);
      _currentPage = 2;
      _showValue = 1;

      notifyListeners();

      return true;
    }
    return false;
  }

  loadMoreData() async {
    var httpURL = url + 'type=$_type&page=$_currentPage';
    var response = await http.get(httpURL);
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      _companyList.addAll(Company.fromMapData(json));
      _currentPage++;

      notifyListeners();

      return true;
    }
    return false;
  }
}
