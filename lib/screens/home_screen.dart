import 'package:edu_connect/screens/home_screens/home_chat.dart';
import 'package:edu_connect/screens/home_screens/home_home.dart';
import 'package:edu_connect/screens/home_screens/home_profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  List<Widget> navbarWidgets = <Widget>[
    HomeChat(),
    HomeHome(),
    HomeProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).accentColor,
        backgroundColor: Color(0xfffffff),

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        //type: BottomNavigationBarType.fixed,

        items: [
          Container(
            child: Icon(Icons.chat),
          ),
          Container(
            child: Icon(Icons.home),
          ),
          Container(
            child: Icon(Icons.face),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'chats',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.face),
          //   label: 'profile',
          // ),
        ],
      ),
      body: navbarWidgets.elementAt(_selectedIndex),
    );
  }
}
