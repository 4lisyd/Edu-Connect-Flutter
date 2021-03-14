import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xff344955),
    primaryColorDark: Color(0xff232F34),
    primaryColorLight: Color(0xff4A6572),
    accentColor: Color(0xffF9AA33),
    backgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xffF9AA33),
        fontSize: 28,
        fontFamily: 'Gotham',
        fontWeight: FontWeight.w900,
      ),
      headline2: TextStyle(
        color: Color(0xff344955),
        fontSize: 20,
        fontFamily: 'Gotham',
        fontWeight: FontWeight.w900,
      ),
      headline3: TextStyle(
        color: Color(0xff344955),
        fontSize: 20,
        fontFamily: 'Bangers',
        fontWeight: FontWeight.w900,
      ),
      bodyText1: TextStyle(
        color: Color(0xff4A6572),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
        // shadows: [Shadow(color: Colors.white, blurRadius: 5)],
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
        fontSize: 12,
        fontFamily: 'Roboto',
        // shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
      ),
    ),
  );
}
