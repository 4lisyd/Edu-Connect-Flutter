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
      headline2: TextStyle(),
      bodyText1: TextStyle(
          color: Color(0xff4A6572),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w300),
      bodyText2: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 15,
        fontFamily: 'Roboto',
      ),
    ),
  );
}