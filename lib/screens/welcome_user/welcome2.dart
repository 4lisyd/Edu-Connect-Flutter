import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcome2 extends StatefulWidget {
  @override
  _Welcome2State createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text("Welcome to Edu-Connect",style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, bottom: 0.0, right: 10.0, left: 10.0),
              child: Text(
                "Are you confused about hiring a Tutor for your Child?",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),

            Lottie.asset("lib/assets/animations/lotties/welcome_confused.json",
                reverse: true, height: 400),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 0.0, right: 10.0, left: 10.0),
              child: Text(
                "out of sensible options?",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 0.0, right: 10.0, left: 10.0),
              child: Text(
                "We're committed to finding the right match between tutor and student; chat with tutors online before they book the appointment,",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                height: 150,
                child: Lottie.asset(
                    "lib/assets/animations/lotties/swipe_left.json",
                    frameRate: FrameRate.max)),

            // Text(
            //   "Swipe Left to continuex",
            //   style: Theme.of(context).textTheme.bodyText2,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
