import 'package:flutter/material.dart';

class BackgroundBody1 extends StatelessWidget {
  Widget childW;

  BackgroundBody1(this.childW);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/background_img/tiles_bg1.jpg"),
              fit: BoxFit.cover)),
      child: childW,
    );
  }
}
