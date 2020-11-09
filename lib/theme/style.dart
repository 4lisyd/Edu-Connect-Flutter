import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(

    primaryColor: Colors.white,
    accentColor: Colors.yellowAccent,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 36.0,),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText1: TextStyle(fontSize: 36.0,),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}