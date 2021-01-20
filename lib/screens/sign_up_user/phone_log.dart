//import 'dart:js';

import 'package:edu_connect/components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:edu_connect/services/auth_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edu_connect/components/dialog_box.dart';
import 'package:lottie/lottie.dart';

class PhoneSignUp extends StatelessWidget {
  //String phonenumber;
  //String userName;
  final _phoneformcontroller = TextEditingController();
  final _phoneformKey = GlobalKey<FormState>();
  final _usernameformKey = GlobalKey<FormState>();
  final _usernameformcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Phone number login"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(children: [
            Positioned(
              top: 20,
              child: Lottie.asset(
                  "lib/assets/animations/lotties/phone_login.json",
                  reverse: true,
                  height: 300),
            ),
            Container(
              height: 370,
              // color: Colors.white,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(.3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text("Enter username",style: Theme.of(context).textTheme.bodyText1,),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Form(
                      key: _phoneformKey,
                      child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty || text[0] != '+') {
                            return 'input a valid number (i.e +974 665 5527 1)';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          print(_phoneformcontroller.text);
                        },
                        controller: _phoneformcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: Icon(Icons.phone_android),
                          hintText: "Enter phone number",
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Form(
                      key: _usernameformKey,
                      child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'field is empty';
                          }
                          if (text.length >= 15 || text.length <= 2) {
                            return 'please input a feasible name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          print(_usernameformcontroller.text);
                        },
                        controller: _usernameformcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          icon: Icon(Icons.face_unlock_outlined),
                          hintText: "Enter your name",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  // Container(
                  //   width: 320,
                  //   color: Theme.of(context).accentColor,
                  //   child: FlatButton(
                  //       textColor: Colors.white,
                  //       child: Text(
                  //         "Continue",
                  //         style: Theme.of(context).textTheme.bodyText2,
                  //       ),
                  //       onPressed: () {
                  //         // showDialog(
                  //         //     context: context,
                  //         //     builder: (BuildContext context) =>
                  //         //         customDialogBox1("FirebaseAuthException"));
                  //         if (_phoneformKey.currentState.validate() &&
                  //             _usernameformKey.currentState.validate()) {
                  //           final phone = _phoneformcontroller.text.trim();
                  //           final userName =
                  //               _usernameformcontroller.text.trim();
                  //
                  //           loginUserPhone(phone, userName, context);
                  //         }
                  //       }),
                  // ),
                  Hero(
                    tag: 'lets find some tutors',
                    child: Custombutton1(
                      () {
                        if (_phoneformKey.currentState.validate() &&
                            _usernameformKey.currentState.validate()) {
                          final phone = _phoneformcontroller.text.trim();
                          final userName = _usernameformcontroller.text.trim();

                          loginUserPhone(phone, userName, context);
                        }
                      },
                      'Continue',
                    ),
                  ),

                  // Text("Enter Password",style: Theme.of(context).textTheme.bodyText1,),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
