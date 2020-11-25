import 'package:flutter/material.dart';

class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://manners4minors.com/wp-content/uploads/2014/07/white_background-1024x640.jpg'),
          ),
        ),
      ),
    );
  }
}
