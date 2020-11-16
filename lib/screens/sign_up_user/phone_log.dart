//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:edu_connect/services/auth_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class PhoneSignUp extends StatelessWidget {
  String phonenumber;
  final _phoneformcontroller = TextEditingController();

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
                child: TextField(
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
                    final phone = _phoneformcontroller.text.trim();
                    loginUserPhone(phone, context);
                  },
                ),
              ),
              // Text("Enter Password",style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
      ),
    );
  }
}
