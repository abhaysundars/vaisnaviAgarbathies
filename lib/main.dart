import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  Widget build(BuildContext context) {
    var SHeight = MediaQuery.of(context).size.height;
    var SWidth = MediaQuery.of(context).size.width;
    return Container(
      height: SHeight,
      width: SWidth,
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/UserApp.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState('https://vyaparionline.com');
}

class _MyAppState extends State<MyApp> {
  var _url = 'https://vyaparionline.com';
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
          color: Colors.blue[300],
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
