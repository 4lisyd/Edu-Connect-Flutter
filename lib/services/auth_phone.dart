import 'package:edu_connect/components/dialog_box.dart';
import 'package:edu_connect/models/shared_preferences.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/home_screen.dart';
import 'package:edu_connect/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Future<bool> loginUserPhone(
    String phone, String username, BuildContext context) async {
  //https://firebase.flutter.dev/docs/auth/phone             reference
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCurrent currentUser_bloc =
      Provider.of<UserCurrent>(context, listen: false);

  // currentUser1 = UserCurrent(_auth);

  //^
  //print(currentUser.uid);
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
        print('user is null');
      }
    },

    ///////
    timeout: Duration(seconds: 60),

    ///////
    verificationFailed: (FirebaseAuthException) {
      print("verification failed+9!");
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
          useRootNavigator: false, //this property needs to be added
          builder: (context) {
            return customDialogBox2(
              "enter the OTP code",
              (String string) async {
                ////////////////////////////////////important//////////////////////////////////////////////

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
                    currentUser_bloc.name = username;
                    currentUser_bloc.phoneNo = phone;
                    UserSign_parent(user1.uid).registerNewUser(username, phone);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    SharedPref sharedpref = SharedPref();
                    sharedpref.save("user", currentUser_bloc.toJson());
                    currentUser_bloc.fromJson(await sharedpref.read('user'));

                    prefs.setBool('login', true);
                    Navigator.pushNamed(context, "/",);

                    // Navigator.canPop(context);
                    ////////////////////////////////////important//////////////////////////////////////////////

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
