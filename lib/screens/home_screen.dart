import 'package:edu_connect/models/shared_preferences.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/home_screens/home_chat.dart';
import 'package:edu_connect/screens/home_screens/home_home.dart';
import 'package:edu_connect/screens/home_screens/home_profile.dart';
import 'package:edu_connect/screens/home_screens/home_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> navbarWidgets = <Widget>[
      HomeChat(),
      HomeHome(),
      HomeSearch(),
      HomeProfile(),
    ];

    SharedPref sharedpref = SharedPref();

    hello() async {
      //print(await sharedpref.read('user'));
      Provider.of<UserCurrent>(context, listen: false).fromJson(
        await sharedpref.read('user'),
      );
    }

    hello();

    return Scaffold(
      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
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
            child: Icon(Icons.search),
          ),
          Container(
            child: Icon(Icons.face),
          ),
        ],
      ),
      body: navbarWidgets.elementAt(_selectedIndex),
    );
  }
}
