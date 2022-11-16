import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VebViewSCreen extends StatefulWidget {
  // const VebViewSCreen({super.key});
  String newsurl;
  VebViewSCreen(this.newsurl);

  @override
  State<VebViewSCreen> createState() => _VebViewSCreenState();
}

class _VebViewSCreenState extends State<VebViewSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: WebView(
        initialUrl: widget.newsurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
