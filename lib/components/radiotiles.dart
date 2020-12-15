import 'package:flutter/material.dart';

class CustomRadioTiles_gender extends StatefulWidget {
  bool userGender_temp;

  CustomRadioTiles_gender();

  @override
  _CustomRadioTiles_genderState createState() =>
      _CustomRadioTiles_genderState();
}

class _CustomRadioTiles_genderState extends State<CustomRadioTiles_gender> {
  int selectedRadio = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Male",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.blueAccent),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: selectedRadio,
              groupValue: 1,
              activeColor: Colors.blueAccent,
              onChanged: (value) {
                setState(() {
                  selectedRadio = 1;
                  widget.userGender_temp = true;
                  print(widget.userGender_temp);
                });
              },
            ),
            Radio(
              value: selectedRadio,
              groupValue: 2,
              activeColor: Colors.pinkAccent,
              onChanged: (value) {
                setState(() {
                  selectedRadio = 2;
                  widget.userGender_temp = false;
                  print(widget.userGender_temp);
                });
              },
            ),
          ],
        ),
        Text(
          "Female",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.pinkAccent),
        ),
      ],
    );
  }
}
