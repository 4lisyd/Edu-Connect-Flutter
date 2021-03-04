import 'package:edu_connect/models/shared_preferences.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/home_screens/home_chat.dart';
import 'package:edu_connect/screens/home_screens/home_home.dart';
import 'package:edu_connect/screens/home_screens/home_profile.dart';
import 'package:edu_connect/screens/home_screens/home_groups.dart';
// import 'package:edu_connect/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' show Platform;


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
      HomeGroups(),
      HomeProfile(),
    ];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference locations_firestore =
    // FirebaseFirestore.instance.collection('locations');

    SharedPref sharedpref = SharedPref();
    User user = FirebaseAuth.instance.currentUser;

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    // hello the user after a session starts

    hello() async {

      if (Platform.isAndroid)
      {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ));
      }

      if (Platform.isIOS)
        {
          SystemChrome.setEnabledSystemUIOverlays([]);
        }

      _firebaseMessaging.getToken().then((value) => print(value));
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("$message onMessage");
        },
        onLaunch: (Map<String, dynamic> message) async {
          print("$message onLaunch");
        },
        onResume: (Map<String, dynamic> message) async {
          print("$message onResume");
        },
      );

      //print(await sharedpref.read('user'));
      Provider.of<UserCurrent>(context, listen: false).fromJson(
        await sharedpref.read('user'),
      );
      // SystemChrome.setEnabledSystemUIOverlays([]);

      // print(Provider.of<UserCurrent>(context, listen: false).uid);
      Provider.of<UserCurrent>(context, listen: false).uid = user.uid;
      // Provider.of<UserCurrent>(context, listen: false).name = user.;
      Provider.of<UserCurrent>(context, listen: false).phoneNo =
          user.phoneNumber;
      // print('ssoosset');
      // print(Provider.of<UserCurrent>(context, listen: false).profileSet);

      DocumentSnapshot temp_isTutor = await FirebaseFirestore.instance
          .collection('parents')
          .doc((Provider.of<UserCurrent>(context, listen: false).uid))
          .get();
      Provider.of<UserCurrent>(context, listen: false).isTutor =
          temp_isTutor.data()['tutor'];

    }

    hello();

    void initState() {}

    void dispose() {
      // TODO: implement dispose
      super.dispose();
      // animationController.dispose() instead of your controller.dispose
    }

    return Container(
      // color: Colors.pinkAccent,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
//https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.pink,

        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: Theme.of(context).accentColor,
          backgroundColor: Color(0xfffffff),
          height: 60,

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
              child: Icon(Icons.group_add_sharp),
            ),
            Container(
              child: Icon(Icons.face),
            ),
          ],
        ),
        body: navbarWidgets.elementAt(_selectedIndex),
        extendBody: true,

        // backgroundColor: Colors.transparent,
      ),
    );
  }
}
