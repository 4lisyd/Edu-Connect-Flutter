import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TutorAttr {
  List<String> subjects = [];
}

class UserCurrent extends ChangeNotifier {
  final FirebaseAuth auth;
  //String name = 'name';
  String name;
  String uid;
  String phoneNo;
  bool loggedin;
  String profilePhotoAsset;
  bool isTutor = false;

  // void setAuthInstance(FirebaseAuth authTEMP) {
  //   auth = authTEMP;
  // }

  UserCurrent([this.auth]) {
    setUser();
  }
  void setUser() {
    print("userSET");
    User user = auth.currentUser;
    this.name = user.displayName != null ? user.displayName : "null";
    this.uid = user.uid != null ? user.uid : "null";
    this.phoneNo = user.phoneNumber != null ? user.phoneNumber : "null";
    this.loggedin = true;

    notifyListeners();
  }

  void setName(String name) {
    this.name = name;

    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNo': phoneNo,
        'uid': uid,
      };

  void fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    phoneNo = json['phoneNo'];
    uid = json['uid'];
  }
}

UserCurrent currentUser1 = UserCurrent();
