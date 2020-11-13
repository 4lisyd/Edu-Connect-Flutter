import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcome1 extends StatefulWidget {
  @override
  _Welcome1State createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text("Welcome to Edu-Connect",style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0,),
              child: Text("We are here to help you find Tutors near you.",
                style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset("lib/assets/animations/lotties/welcome_welcome.json",reverse: true,height: 400),
            Container(height: 150,child: Lottie.asset("lib/assets/animations/lotties/swipe_left.json",frameRate: FrameRate.max)),
            Text("Swipe Left to continue the journey",style: Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.center,),
          ],
        ),
      ),



    );
  }
}