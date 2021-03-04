import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCurrent extends ChangeNotifier {
  /// final FirebaseAuth auth;
  //String name = 'name';
  String name;
  String uid;
  String phoneNo;
  bool loggedin;
  String profilePhotoAsset = 'lib/assets/userData/defaultUserAvatar.png';
  bool profileSet = false;
  bool isTutor = false;
  String locationString = "All Areas";
  // Location location;
  // void setAuthInstance(FirebaseAuth authTEMP) {
  //   auth = authTEMP;
  // }

  UserCurrent() {
    print("new usercurretn");
  }

  void setProfileImage(String photoAsset) {
    this.profilePhotoAsset = photoAsset;
    this.profileSet = true;
    notifyListeners();
  }

  void setLocationString(String location){
    this.locationString = location;
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
    // print("from json being executed");
    this.name = json['name'];
    this.phoneNo = json['phoneNo'];
    this.uid = json['uid'];
    //this.profilePhotoAsset = 'lib/assets/userData/defaultUserAvatar.png';

    //  print(';;;;;;;;;;;;;;;;;;');

    // print(uid);

    // print(';;;;;;;;;;;;;;;;;;');

    notifyListeners();
  }
}

// UserCurrent currentUser1 = UserCurrent();
