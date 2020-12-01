import 'package:flutter/material.dart';
import 'package:vscode_flutter/home.dart';
import 'package:vscode_flutter/mine/SecondScreen.dart';
import 'package:vscode_flutter/mine/ThirdSceen.dart';
import 'package:vscode_flutter/provider/company_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CompanyListProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/second': (context) {
          return SecondScreen('ceshi');
        },
        '/third': (context) {
          return ThirdScreen();
        }
      },
      home: FlowerApp(),
    );
  }
}
