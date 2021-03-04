import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombutton1 extends StatelessWidget {
  Custombutton1(
    Function this.onPressed,
    String this.buttonlabel, {
    Color this.buttonColor,
  });

  final Function onPressed;
  Color buttonColor;
  String buttonlabel;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 220,
            height: 50,
            color: buttonColor != null
                ? buttonColor
                : Theme.of(context).accentColor,
            child: Center(
                child: Text(
              buttonlabel,
              style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black54,fontSize: 15),
            )),
          ),
        ));
  }
}
