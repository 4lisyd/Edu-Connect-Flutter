import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


// ?????????             ???????????



/*

the chat works like this:
1 if sendertID >> recID document id would be chatID+recID else opposite
2 to find relevant chats if chatID has any of them ^ it your chat in home_chat
3 to find relevant messages for your chatroom condition 1 + sendertID + ' '+  recID
4 send message and save them in format from condtion 3
5

*/


//           ????????????           ????????????

class ChatService {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> returnActiveChatsOfUser(
    String uid,
  ) {
    bool isTutor = true;
    // firestoreInstance.collection('parents').doc(uid).get().then((value) => () {
    if (isTutor) {
      print('is tutor nt exe');

      return firestoreInstance
          .collection('messages')
          .where("chatID", arrayContains: uid)
          // .orderBy('messages.time', descending: true)
      
          .snapshots();
    } else {
      print('is tutor nt exe');

      // return firestoreInstance.collection('parents').doc(uid).snapshots();
    }
    // });

    // firestoreInstance.collection(collectionPath)
  }
  // CollectionReference returnCurrentChatRef(String senderID, String receiverID){
  //   return firestoreInstance.collection('messages').where('senderID',isEqualTo: senderID).where("receiverID",isEqualTo: receiverID);
  //
  // }
  Future<dynamic> returnCurrentChatRef(String senderID, String receiverID){
    var cmp_temp = senderID.compareTo(receiverID);
    if (cmp_temp == -1){
       return firestoreInstance.collection('messages').doc(senderID+' '+receiverID).get();
    }
    else{
      return firestoreInstance.collection('messages').doc(receiverID+' '+senderID).get();

    }
    // return firestoreInstance.collection('messages').doc();

  }



  sendMessage(String senderID, String receiverID, String message) async {
    print('sd');
    print(senderID);
    print(receiverID);
    print(message);
    print('sd');

    var messageID_inCloud = firestoreInstance
        .collection('messages')
        .where('chatID', arrayContainsAny: [senderID, receiverID])
        .get()
        .then((value) => value.docs.first.id);
    // String mmessageID_inCloud = messageID_inCloud.then((value) => value.docs.first.id);// print('sdssss');
    print(await messageID_inCloud);
    print('666666');

    var temp =
        firestoreInstance.collection('messages').doc(await messageID_inCloud)

            // .doc('1V1CKAsyUOtAMGwLPPYP Uvwb4fAWuyRnWyKB2rarRnD8DBH2')
            .set({
          "lastmessagetime": Timestamp.now(),
          "messages": FieldValue.arrayUnion([
        {
          "message": message,
          "seen": false,
          'time': Timestamp.now(),
          "senderID": senderID,
        }
      ])
    }, SetOptions(merge: true));


    // print("temp.whenComplete(() => temp.toString())");
  }
}
