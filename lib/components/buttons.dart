import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombutton1 extends StatelessWidget {
  Custombutton1(Function this.onPressed, String this.buttonlabel);

  final Function onPressed;

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
            color: Theme.of(context).accentColor,
            child: Center(
                child: Text(
              buttonlabel,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )),
          ),
        ));
  }
}
