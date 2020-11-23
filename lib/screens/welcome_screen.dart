import 'package:edu_connect/screens/welcome_user/welcome1.dart';
import 'package:edu_connect/screens/welcome_user/welcome2.dart';
import 'package:edu_connect/screens/welcome_user/welcome3.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: [
          Welcome1(),
          Welcome2(),
          Welcome3(),
        ],
      ),
    );
  }
}
