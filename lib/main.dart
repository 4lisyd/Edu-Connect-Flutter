import 'package:edu_connect/theme/style.dart';
import 'package:flutter/material.dart';
import 'screens/intro_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: Intro(),
    );
  }
}

