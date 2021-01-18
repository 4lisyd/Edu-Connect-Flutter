import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/screens/sign_up_user/phone_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';
import 'package:edu_connect/screens/sign_up_screen.dart';

class Welcome3 extends StatefulWidget {
  @override
  _Welcome3State createState() => _Welcome3State();
}

class _Welcome3State extends State<Welcome3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -60,
            right: -80,
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                "lib/assets/UI_pictures/background_pictures/signup_top.png",
              ),
            ),
          ),
          // Positioned(
          //   // bottom: -138,
          //   bottom: -80,
          //   left: -60,
          //   child: RotatedBox(
          //     quarterTurns: 1,
          //     child: Image.asset(
          //         "lib/assets/UI_pictures/background_pictures/welcome_bottom.png"),
          //   ),
          // ),
          Positioned(
            bottom: -60,
            left: -30,
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                  "lib/assets/UI_pictures/background_pictures/welcome_bottom.png"),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -30,
            child: Image.asset(
                "lib/assets/UI_pictures/background_pictures/welcome_bottom.png"),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Lottie.asset(
                      "lib/assets/animations/lotties/welcome_email.json",
                      reverse: true,
                      height: 400),
                  // Custombutton1(() {
                  //   Navigator.pushNamed(context, '/signup');
                  // }, "i am a Parent/Guardian."),
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: 'lets find some tutors',
                    child: Custombutton1(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhoneSignUp()),
                      );
                    }, "Let's find some Tutors"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// FlatButton(
// color: Theme.of(context).primaryColor,
// splashColor: Theme.of(context).accentColor,
// focusColor: Theme.of(context).accentColor,
// // shape: ,
// onPressed: (){
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => SignUp()),
// );
// },
// child: Text(
// "Continue",
// style: (Theme.of(context).textTheme.bodyText2),
//
// ),
// ),
