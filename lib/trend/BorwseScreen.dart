import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatelessWidget {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网页'),
      ),
      body: WebView(
        initialUrl: 'https://flutterchina.club/',
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onPageStarted: (url) {
          //界面开始加载
        },
        onPageFinished: (url) {
          //界面加载完成
        },
      ),
    );
  }
}
