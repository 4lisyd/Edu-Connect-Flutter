import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> returnChatStreamOfUser(
    String uid,
  ) {
    bool isTutor = true;
    // firestoreInstance.collection('parents').doc(uid).get().then((value) => () {
    if (isTutor) {
      print('is tutor nt exe');

      return firestoreInstance
          .collection('messages')
          .where("chatID", arrayContains: uid)
          .snapshots();
    } else {
      print('is tutor nt exe');

      // return firestoreInstance.collection('parents').doc(uid).snapshots();
    }
    // });

    // firestoreInstance.collection(collectionPath)
  }

  sendMessage(String senderID, String message) {
    print('sd');
    var temp = firestoreInstance
        .collection('messages')
        // .where('senderID', arrayContains: [senderID])
        .doc('1V1CKAsyUOtAMGwLPPYP Uvwb4fAWuyRnWyKB2rarRnD8DBH2')
        .set({}, SetOptions(merge: true));

    print("temp.whenComplete(() => temp.toString())");
  }
}
