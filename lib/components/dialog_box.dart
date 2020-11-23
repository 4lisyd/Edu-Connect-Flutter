import 'package:flutter/material.dart';
import 'package:edu_connect/components/buttons.dart';

class customDialogBox1 extends StatelessWidget {
  customDialogBox1(String this.message);
  final message;

  String trimError(String string) {
    String tempstring = '';
    bool tempbool = false;
    for (int i = 0; i < string.length; i++) {
      var char = string[i];
      if (char == '[') {
        tempbool = true;
      }

      if (tempbool == false) {
        tempstring = tempstring.toString() + char.toString();
      }
      if (char == ']') {
        tempbool = false;
      }
    }
    return tempstring;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Theme.of(context).primaryColor,
          height: 300,
          width: 370,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                Text(
                  "Error",
                  style: Theme.of(context).textTheme.headline1,
                ),
                // SizedBox(
                //   height: 30,
                // ),
                Text(
                  trimError(message),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 10,
                ),
                Custombutton_error1(() {
                  Navigator.pop(context);
                }, "Okay!"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}