import 'package:flutter/material.dart';

class customTextField1 extends StatelessWidget {
  String hint_text;
  TextInputType keyboard_type;
  TextEditingController textEditingController;
  Icon leading_icon = Icon(Icons.keyboard_arrow_right_outlined);

  customTextField1(
    this.hint_text,
    this.keyboard_type,
    this.textEditingController, {
    this.leading_icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 40, right: 40, top: 0),
      height: 54,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(.7),
              blurRadius: 50,
              offset: Offset(0, 10),
              spreadRadius: -10),
        ],
      ),
      child: TextField(
        maxLines: keyboard_type == TextInputType.multiline ? null : 1,
        autofocus: true,
        cursorColor: Theme.of(context).primaryColor,
        controller: textEditingController,
        textAlign: TextAlign.center,
        keyboardType: keyboard_type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hint_text,
          suffixIcon: leading_icon,
        ),
      ),
    );
  }
}
