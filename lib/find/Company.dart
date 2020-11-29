
import 'dart:convert';

import 'package:flutter/material.dart';

class Company {
  
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  //构造函数
  Company({
    @required this.logo,
    @required this.name,
    @required this.location,
    @required this.type,
    @required this.size,
    @required this.employee,
    @required this.hot,
    @required this.count,
    @required this.inc
  });

  //json string =》 List<Company>
  static List<Company> fromJson(String json) {
    List<Company> listModel = new List<Company>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) { 
      Company model = Company.fromMap(element);
      listModel.add(model);
    });
    return listModel;
  }

  //map => model
  static Company fromMap(Map map) {
        return new Company(
          logo: map['logo'],
          name: map['name'],
          location: map['location'],
          type: map['type'],
          size: map['size'],
          employee: map['employee'],
          hot: map['hot'],
          count: map['count'],
          inc: map['inc']);
  }

  //network
  static List<Company> fromMapData(Map data) {
    List<Company> listModel = new List<Company>();
    List list = data['list'];
    list.forEach((element) { 
      Company model = Company.fromMap1(element);
      listModel.add(model);
    });
    return listModel;
  }

  static Company fromMap1(Map map) {
        return new Company(
          logo: map['logo_url'],
          name: map['market_name'],
          location: map['download_times_fixed'],
          type: map['type'],
          size: map['tag'],
          employee: map['market_id'],
          hot: map['download_times_fixed'],
          count: map['cid2'],
          inc: map['baike_name']);
  }


}