import 'package:cloud_firestore/cloud_firestore.dart';

class UserSign_parent {
  String uid;

  UserSign_parent(this.uid);

  final CollectionReference parentCollection =
      FirebaseFirestore.instance.collection("parents");

  Future registerNewUser(String name, String phoneNo) async {
    return await parentCollection
        .doc(uid)
        .set({"name": name, "phoneNo": phoneNo});
  }

  //collection reference
}
