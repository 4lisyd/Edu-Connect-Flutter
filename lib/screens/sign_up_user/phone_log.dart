

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:edu_connect/services/auth_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class PhoneSignUp extends StatelessWidget {


  String phonenumber;
  final _phoneformcontroller = TextEditingController();
  final _codeformcontroller = TextEditingController();

  Future<bool> loginUserPhone(String phone, BuildContext context) async {
    //https://firebase.flutter.dev/docs/auth/phone             reference
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(

      phoneNumber: phone,
      verificationCompleted: (AuthCredential credential) async {
        UserCredential response = await _auth.signInWithCredential(credential);
        User user = response.user;

        if (user != null) {
          // gets called when the verification is done automatically by auto code retrieval
        }
      },

      timeout: Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException) {
        print(Exception);
      },

      codeSent: (String verificationID, int forceResendingToken) {
        showDialog(context: context,
          barrierDismissible: false,
          useSafeArea: true,
          builder: (context){
              return AlertDialog(
                title: Text("enter the code you just received"),
                content: Column(
                  children: [
                    TextField(
                      controller: _codeformcontroller,
                    ),
                  ],
                ),
                actions: [
                  FlatButton(onPressed: () async {
                    AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: _codeformcontroller.text);
                    UserCredential response = await _auth.signInWithCredential(credential);
                    User user = response.user;

                    if (user != null) {
                       print(response.user.phoneNumber);
                       print("success!");// gets called when the verification is done automatically by auto code retrieval
                    }
                  },
                      child: Text("confirm"))
                ],
              );
          }

        );
      },
      codeAutoRetrievalTimeout: (verificationID){},
    );
  }


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
                padding: const EdgeInsets.only(left: 30,right: 50),
                child: TextField(
                  onChanged: (value){
                    print(_phoneformcontroller.text);
                  },
                  controller: _phoneformcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                  onPressed: (){
                    final phone = _phoneformcontroller.text.trim();
                    loginUserPhone(phone,context);
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
