import 'package:flutter/material.dart';

class Chats {
  Widget returnBubble(String msg) {
    return Container(
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(msg),
    );
  }

  Widget returnChatList(String msg) {
    return Container(
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(msg),
    );
  }
}
