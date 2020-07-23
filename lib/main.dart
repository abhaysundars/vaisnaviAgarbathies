import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:animated_splash/animated_splash.dart';

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vaisnavi Agarbaties",
      routes: {
        "/": (_) => new SafeArea(
              child: WebviewScaffold(
                url: "https://vaisnaviagarbati.com",
              ),
            )
      },
    );
  }
}
