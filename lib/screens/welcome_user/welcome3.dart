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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
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
                  // scale: 0?,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: 0,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  "lib/assets/UI_pictures/background_pictures/welcome_bottom.png",
                  scale: 1.35,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2.3,
                      child: Lottie.asset(
                          "lib/assets/animations/lotties/welcome_email.json",
                          width: 400,
                          reverse: true,
                          height: 400,
                      ),

                    ),

                    // Before you embark upon the search for the perfect tutor, the first thing you need to do is make sure that you know exactly what you and your child needs from from a tutor.
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, bottom: 65.0, right: 10.0, left: 10.0),
                      child: Text(
"Before you embark upon the search for the perfect tutor, the first thing you need to do is make sure that you know exactly what you and your child needs from from a tutor.",                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 0,
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
      ),
    );
  }
}

