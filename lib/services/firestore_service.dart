import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/tutor.dart';
import 'package:edu_connect/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

final CollectionReference parentCollection =
    FirebaseFirestore.instance.collection("parents");

final CollectionReference tutorCollection =
    FirebaseFirestore.instance.collection("tutors");

final CollectionReference locationCollection =
    FirebaseFirestore.instance.collection("locations");

class UserSign_parent {
  String uid;

  UserSign_parent(this.uid);

  final CollectionReference parentCollection =
      FirebaseFirestore.instance.collection("parents");

  Future registerNewUser(String name, String phoneNo) async {
    return await parentCollection
        .doc(uid)
        .set({"name": name, "phoneNo": phoneNo, "tutor": false});
  }

  //collection reference
}

class UserSign_Tutor {
  UserSign_Tutor(
    this.uid,
  );

  String uid;

  final CollectionReference TutorCollection =
      FirebaseFirestore.instance.collection("tutors");

  Future registerNewUser(
    Tutor tutor,
  ) async {
    print('printing tutor name');
    print(tutor.name);
    print('printing tutor name');

    return await TutorCollection.doc(uid).set({
      "name": tutor.name,
      "uid": uid,
      "phoneNo": tutor.name,
      "gender": tutor.gender,
      'bio': tutor.bio,
      'area': tutor.area,
      'email': tutor.email,
      'daysAvailability': tutor.daysAvailable,
      'subjectsPreferred': tutor.subjectPreferred,
      "testsPreferred": tutor.testPreferred,
      "employed": tutor.areYou["employed"],
    });
  }

//collection reference
}

class userAssetBuilder {}
