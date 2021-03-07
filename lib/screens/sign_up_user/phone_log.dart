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

  //todo:  test for variable screen sizes and how the keyboard behaves

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Phone number login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(children: [
              Expanded(
                child: Container(
                  child: Lottie.asset(
                    "lib/assets/animations/lotties/phone_login.json",
                    reverse: true,
                    // height: 300,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin:
                      EdgeInsets.only(left: 0, top: 0, bottom: 20, right: 10),
                  height: 370,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(.3),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //Text("Enter username",style: Theme.of(context).textTheme.bodyText1,),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Form(
                            key: _phoneformKey,
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text[0] != '+') {
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
                      ),
                      SizedBox(height: 20),

                      Expanded(
                        child: Padding(
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
                      ),
                      SizedBox(height: 50),

                      Expanded(
                        child: Hero(
                          tag: 'lets find some tutors',
                          child: Custombutton1(
                            () {
                              if (_phoneformKey.currentState.validate() &&
                                  _usernameformKey.currentState.validate()) {
                                final phone = _phoneformcontroller.text.trim();
                                final userName =
                                    _usernameformcontroller.text.trim();

                                loginUserPhone(phone, userName, context);
                                // Navigator.pushNamed(context, "/",);

                              }
                            },
                            'Continue',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
