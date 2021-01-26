import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/services/chat.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_connect/services/chat.dart';
import 'package:edu_connect/screens/chat_screen/ongoing_chat.dart';
import 'package:provider/provider.dart';

class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  ChatService chatservice = ChatService();

  @override
  Widget build(BuildContext context) {
    var firestoreInstance = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text("Active Chats"),
        automaticallyImplyLeading: false,
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
          stream: chatservice.returnActiveChatsOfUser(
              Provider.of<UserCurrent>(context, listen: false).uid),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  for (var item in snapshot.data.docs)
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OngoingChat(
                                      item.data()['chatID'][0] ==
                                              Provider.of<UserCurrent>(context)
                                                  .uid
                                          ? item.data()['chatID'][0]
                                          : item.data()['chatID'][1],
                                      item.data()['chatID'][0] ==
                                              Provider.of<UserCurrent>(context)
                                                  .uid
                                          ? item.data()['chatID'][1]
                                          : item.data()['chatID'][0],
                                    )));
                      },
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'lib/assets/userData/defaultUserAvatar.png',
                              // color: Colors.transparent,
                              fit: BoxFit.contain,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 80,
                              // width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Theme.of(context).primaryColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image.network('src'),
                                  // Text(
                                  //   //Todo: last message must be shown
                                  //
                                  //   ,
                                  //
                                  //   style: Theme.of(context).textTheme.bodyText2,
                                  // ),

                                  FutureBuilder<DocumentSnapshot>(
                                    future: firestoreInstance
                                        .collection('parents')
                                        .doc(item.data()['chatID'][0] ==
                                                Provider.of<UserCurrent>(
                                                        context)
                                                    .uid
                                            ? item.data()['chatID'][1]
                                            : item.data()['chatID'][0])
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data.data()['name'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(fontSize: 20),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                  Text(
                                    //Todo: last message must be shown

                                    item.data()['messages']
                                            [item.data()['messages'].length - 1]
                                        ['message'],
                                    // "item.data().entries.last.value['message'].toString()",
                                    // item.data()['messages'][0]['message'],

                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
