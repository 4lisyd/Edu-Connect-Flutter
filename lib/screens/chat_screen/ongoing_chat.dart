import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:edu_connect/services/chat.dart';

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
    var chatRef = firestoreInstance.collection('messages');
    //.orderBy('time', descending: true);
    // .where('chatID', arrayContains: [widget.senderID]);

    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DocumentSnapshot>(
          future: receiverRef.get(),
          builder: (context, snapshot) {
            return Text(snapshot.data.data()['name']);
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: chatRef.snapshots(),
          builder: (context, snapshot) {
            return Container(
              color: Colors.pinkAccent,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //messages container column
                  Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      for (var item in snapshot.data.docs[0].data()['messages'])
                        Bubble(
                          margin: BubbleEdges.only(top: 10),
                          padding: BubbleEdges.all(20),
                          color: item['senderID'] == widget.senderID
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).accentColor,
                          alignment: item['senderID'] == widget.senderID
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
                              textAlign: item['senderID'] == widget.senderID
                                  ? TextAlign.left
                                  : TextAlign.right),
                        ),
                      // Bubble(
                      //   margin: BubbleEdges.only(top: 10),
                      //   nip: BubbleNip.leftTop,
                      //   color: Theme.of(context).accentColor,
                      //   child: Text(
                      //       "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                      //       textAlign: TextAlign.right),
                      // ),
                      // Bubble(
                      //   margin: BubbleEdges.only(top: 10),
                      //   nip: BubbleNip.rightTop,
                      //   color: Theme.of(context).primaryColor,
                      //   child: Text(
                      //       "Lorem ipsum dunt ut labore et dolore magna aliqua.",
                      //       textAlign: TextAlign.right),
                      // ),
                    ],
                  ),
                  //end of messages container
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 30, right: 10, left: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.71,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          // height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            controller: messageController,
                          ),
                        ),
                        Container(
                          width: 50,
                          child: FlatButton(
                            onPressed: () {
                              print("send message");
                              if (messageController.text.trim().isNotEmpty) {
                                //send messages
                                widget.chatservice.sendMessage(
                                    widget.senderID, "alright its working");
                              }
                            },
                            child: Icon(
                              Icons.send,
                              size: 35,
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
          }),
    );
  }
}
