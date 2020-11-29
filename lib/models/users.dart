import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserCurrent extends ChangeNotifier {
  String name = "username not set";
  String uid;
  String phoneNo = 'phone number not set';
  bool loggedin = false;
  String profilePhotoAsset;

  void setUser(String name, String uid, String phoneNo, bool loggedin) {
    print("userSET");
    this.name = name;
    this.uid = uid;
    this.phoneNo = phoneNo;
    this.loggedin = loggedin;

    notifyListeners();
  }

  void setName(String name) {
    this.name = name;

    notifyListeners();
  }
}

// class Users {
//   List<User> users = [];
// }

UserCurrent currentUser = UserCurrent();
