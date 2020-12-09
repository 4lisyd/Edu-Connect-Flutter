import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TutorSignUp extends StatefulWidget {
  @override
  _TutorSignUpState createState() => _TutorSignUpState();
}

class _TutorSignUpState extends State<TutorSignUp> {
  File _image;

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image.toString());

    setState(() {
      _image = image;
    });
  }

  //
  // FlatButton(
  // onPressed: () {
  // getImage();
  // },
  // child: Container(
  // color: Colors.amberAccent,
  // height: 50,
  // ),
  // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Sign Up as a tutor noddw! ',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                          'lib/assets/userData/defaultUserAvatar.png'),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () {
                            getImage();
                          },
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                          ),
                        ),
                        Text(
                          "Add photo",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
