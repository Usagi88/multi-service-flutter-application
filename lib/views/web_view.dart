import 'dart:io';

import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewFile extends StatefulWidget {
  String? url;
  WebViewFile({Key? key, this.url}) : super(key: key);

  @override
  _WebViewFileState createState() => _WebViewFileState();
}

class _WebViewFileState extends State<WebViewFile> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}