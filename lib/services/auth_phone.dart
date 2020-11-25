import 'package:edu_connect/components/dialog_box.dart';
import 'package:edu_connect/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> loginUserPhone(String phone, BuildContext context) async {
  //https://firebase.flutter.dev/docs/auth/phone             reference
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final _codeformcontroller = TextEditingController();

  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    //////
    verificationCompleted: (AuthCredential credential) async {
      print('called');

      UserCredential response = await _auth.signInWithCredential(credential);
      User user = response.user;

      if (user != null) {
        // gets called when the verification is done automatically by auto code retrieval
        print('called');
      }
    },

    ///////
    timeout: Duration(seconds: 60),

    ///////
    verificationFailed: (FirebaseAuthException) {
      print("success122!");
      print(FirebaseAuthException);
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              customDialogBox1(FirebaseAuthException.toString()));
    },
    ///////
    codeSent: (String verificationID, int forceResendingToken) {
      print("success12xx2!");
      showDialog(
          context: context,
          barrierDismissible: false,
          useSafeArea: true,
          builder: (context) {
            return customDialogBox2(
              "please enter the OTP code",
              (String string) async {
                try {
                  AuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationID, smsCode: string);
                  UserCredential response =
                      await _auth.signInWithCredential(credential);
                  User user = response.user;

                  if (user != null) {
//print(response.user.phoneNumber);
                    print("xokx");
                    User user1 = await FirebaseAuth.instance.currentUser;
                    print(user1.phoneNumber);
                    print(user.displayName);
                    print(user.uid);

                    Navigator.pop(context);

// gets called when the verification is done automatically by auto code retrieval
                  }
                } catch (e) {
                  print(e);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return customDialogBox1(e.toString());
                    },
                  );
                }
              },
            );
          });
    },

    //////
    codeAutoRetrievalTimeout: (verificationID) {
      print("success122!");
    },
  );
}

// () async {
// AuthCredential credential = PhoneAuthProvider.credential(
//     verificationId: verificationID,
//     smsCode: _codeformcontroller.text);
// UserCredential response =
//     await _auth.signInWithCredential(credential);
// User user = response.user;
//
// if (user != null) {
// //print(response.user.phoneNumber);
// print("success!");
// //print(user.phoneNumber);
// //print(user.displayName);
// //print(user.uid);
// User user1 = await FirebaseAuth.instance.currentUser;
// print(user1.phoneNumber);
// print(user.displayName);
// print(user.uid);
//
// Navigator.pop(context);
//
// // gets called when the verification is done automatically by auto code retrieval
// }
// },
//
//
//
// return AlertDialog(
// title: Text("enter the code you just received"),
// content: Column(
// children: [
// TextField(
// controller: _codeformcontroller,
// ),
// ],
// ),
// actions: [
// FlatButton(
// onPressed: () async {
// AuthCredential credential = PhoneAuthProvider.credential(
//     verificationId: verificationID,
//     smsCode: _codeformcontroller.text);
// UserCredential response =
//     await _auth.signInWithCredential(credential);
// User user = response.user;
//
// if (user != null) {
// //print(response.user.phoneNumber);
// print("success!");
// //print(user.phoneNumber);
// //print(user.displayName);
// //print(user.uid);
// User user1 = await FirebaseAuth.instance.currentUser;
// print(user1.phoneNumber);
// print(user.displayName);
// print(user.uid);
//
// Navigator.pop(context);
//
// // gets called when the verification is done automatically by auto code retrieval
// }
// },
// child: Text("confirm"))
// ],
// );
