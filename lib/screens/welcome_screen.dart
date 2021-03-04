import 'package:edu_connect/screens/welcome_user/welcome1.dart';
import 'package:edu_connect/screens/welcome_user/welcome2.dart';
import 'package:edu_connect/screens/welcome_user/welcome3.dart';
import 'package:flutter/material.dart';

// import 'package:just_audio/just_audio.dart';
//not being used atm ^
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,

      body: PageView(
        allowImplicitScrolling: true,
        // physics: ScrollPhysics(parent: ClampingScrollPhysics()),
        onPageChanged: (value) {
          print(value);
        },
        children: [
          Welcome1(),
          Welcome2(),
          Welcome3(),
        ],
      ),
    );
  }
}
