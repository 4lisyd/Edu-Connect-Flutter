import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:edu_connect/services/chat.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../services/firestore_service.dart';

class OngoingChat extends StatefulWidget {
  //var firestoreInstance = FirebaseFirestore.instance;
  //var chatRef = firestoreInstance.collection('tutors').doc(tid);

  // String ChatID;
  ChatService chatservice = ChatService();

  String senderID;
  String receiverID;

  OngoingChat(this.senderID, this.receiverID);

  @override
  _OngoingChatState createState() => _OngoingChatState();
}

class _OngoingChatState extends State<OngoingChat> {
  @override
  Widget build(BuildContext context) {
    var firestoreInstance = FirebaseFirestore.instance;
    var receiverRef =
        firestoreInstance.collection('parents').doc(widget.receiverID);
    var senderRef = firestoreInstance
      ..collection('parents').doc(widget.senderID);

    ChatService chatservice = ChatService();

    DocumentReference chatRef =
        chatservice.returnCurrentChatRef(widget.senderID, widget.receiverID);

    ScrollController chatscrollcontroller = ScrollController();

    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DocumentSnapshot>(
          future: receiverRef.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.data()['tutor'] == false) {
                return Text(
                  snapshot.data.data()['name'],
                );
              } else
                return FutureBuilder<DocumentSnapshot>(
                  future: tutorCollection.doc(widget.receiverID).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.data()['name']);
                    } else {
                      return Text('Tutor');
                    }
                  },
                );
            } else {
              return Container();
            }
          },
        ),
        actions: [
          //todo: it should not be a document snapshot as it will not update the messages in the real time.

          FutureBuilder<DocumentSnapshot>(
              future: receiverRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MaterialButton(
                    onPressed: () {
                      _callNumber() async {
                        bool res = await FlutterPhoneDirectCaller.callNumber(
                            snapshot.data.data()['phoneNo']);
                      }

                      _callNumber();
                      //
                    },
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return Container();
                }
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // reverse: true,
              dragStartBehavior: DragStartBehavior.down,
              reverse: true,
              controller: chatscrollcontroller,
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: StreamBuilder<DocumentSnapshot>(
                    // AsyncSnapshot<QuerySnapshot> snapshot

                    stream: chatRef.snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return Container(
                        // color: Colors.pinkAccent,
                        // height: MediaQuery.of(context).size.height * 0.94,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //messages container column
                            SingleChildScrollView(
                              child: Column(
                                verticalDirection: VerticalDirection.down,
                                children: [
                                  Text(
                                    snapshot.data.data().toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  for (var item
                                      in snapshot.data.data()['messages'])
                                    // for (var item in snapshot.data.docs)
                                    Bubble(
                                      margin: BubbleEdges.only(top: 10),
                                      padding: BubbleEdges.all(20),
                                      color: item['senderID'] == widget.senderID
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).accentColor,
                                      alignment:
                                          item['senderID'] == widget.senderID
                                              ? Alignment.topRight
                                              : Alignment.topLeft,

                                      nip: item['senderID'] == widget.senderID
                                          ? BubbleNip.rightTop
                                          : BubbleNip.leftTop,
                                      // nip: BubbleNip.rightTop,
                                      // color: Theme.of(context).primaryColor,
                                      child: Text(item['message'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(color: Colors.white),
                                          // textAlign: item.data()['messages'][0]['senderID'] ==
                                          //         widget.senderID
                                          //     ? TextAlign.right
                                          //     : TextAlign.left),
                                          textAlign: item['senderID'] ==
                                                  widget.senderID
                                              ? TextAlign.left
                                              : TextAlign.right),
                                    ),
                                ],
                              ),
                            ),
                            //end of messages container
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 22, right: 10, left: 10, top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.71,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.all(3),
                  // height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    controller: messageController,
                  ),
                ),
                Container(
                  width: 50,
                  child: FlatButton(
                    onPressed: () {
                      chatscrollcontroller.jumpTo(0);
                      print("send message");
                      if (messageController.text.trim().isNotEmpty) {
                        //send messages
                        widget.chatservice.sendMessage(widget.senderID,
                            widget.receiverID, messageController.text);
                        messageController.clear();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
