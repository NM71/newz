import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/blog.png',width: 35, height: 35,),
            // Text(
            //   'NEWZ',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       color: Colors.green,
            //       fontFamily: 'Righteous',
            //       fontSize: 35),
            // ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
