import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:progress_indicators/progress_indicators.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedSplash(
      imagePath: 'assets/logo.png',
      home: MyApp(),
      duration: 2000,
      type: AnimatedSplashType.StaticDuration,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState('https://vaisnaviagarbati.com');
}

class _MyAppState extends State<MyApp> {
  var _url = 'https://vaisnaviagarbati.com';
  final _key = UniqueKey();

  _MyAppState(this._url);
  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
      index: _stackToView,
      children: [
        Column(
          children: <Widget>[
            Expanded(
                child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
              onPageFinished: _handleLoad,
            )),
          ],
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    )));
  }
}

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _MyAppState(this.url);
}
