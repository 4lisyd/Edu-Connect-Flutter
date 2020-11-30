//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:edu_connect/services/auth_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edu_connect/components/dialog_box.dart';

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
      appBar: AppBar(
        title: Text("Phone number login"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text("Enter username",style: Theme.of(context).textTheme.bodyText1,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 50),
                child: Form(
                  key: _phoneformKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'field is empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(_phoneformcontroller.text);
                    },
                    controller: _phoneformcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.phone_android),
                      hintText: "Enter phone number",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 50),
                child: Form(
                  key: _usernameformKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'field is empty';
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
              SizedBox(height: 30),
              Container(
                width: 320,
                color: Theme.of(context).accentColor,
                child: FlatButton(
                    textColor: Colors.white,
                    child: Text("Continue"),
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) =>
                      //         customDialogBox1("FirebaseAuthException"));
                      if (_phoneformKey.currentState.validate() &&
                          _usernameformKey.currentState.validate()) {
                        final phone = _phoneformcontroller.text.trim();
                        final userName = _usernameformcontroller.text.trim();

                        loginUserPhone(phone, userName, context);
                      }
                    }),
              ),
              // Text("Enter Password",style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
      ),
    );
  }
}
