import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcome1 extends StatefulWidget {
  @override
  _Welcome1State createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to Edu-Connect",
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: Theme.of(context).accentColor,
                  fontSize: 25,
                  shadows: [
                    Shadow(
                        color: Theme.of(context).accentColor,
                        offset: Offset(-5, 12),
                        blurRadius: 30)
                  ]),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Text(
                "We are here to help you find Tutors near you.",
                style: Theme.of(context).textTheme.bodyText1.copyWith(),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset("lib/assets/animations/lotties/welcome_welcome.json",
                reverse: true, height: 400),
            Expanded(
              child: Lottie.asset(
                  "lib/assets/animations/lotties/swipe_left.json",
                  frameRate: FrameRate.max),
            ),
            Text(
              "Swipe Left to continue the journey",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
