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
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                "Lets Get Started?",
                textAlign: TextAlign.center,
              ),
              Text(
                "Lets Get Started?",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Lottie.asset("lib/assets/animations/lotties/welcome_email.json",
                  reverse: true, height: 400),
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
