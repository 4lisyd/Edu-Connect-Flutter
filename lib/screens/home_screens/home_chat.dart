import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/services/chat.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_connect/services/chat.dart';
import 'package:edu_connect/screens/chat_screen/ongoing_chat.dart';

class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  ChatService chatservice = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Chats"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
                'https://manners4minors.com/wp-content/uploads/2014/07/white_background-1024x640.jpg'),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: chatservice
              .returnChatStreamOfUser('Uvwb4fAWuyRnWyKB2rarRnD8DBH2'),
          builder: (BuildContext context, snapshot) {
            List lastmessage_temp =
                snapshot.data.docs.single.data()['messages'];
            String lastmessage = lastmessage_temp.last['message'];

            return FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OngoingChat(
                              'Uvwb4fAWuyRnWyKB2rarRnD8DBH2',
                              'Uvwb4fAWuyRnWyKB2rarRnD8DBH2',
                            )));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    // Image.network('src'),
                    Text(
                      lastmessage,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
