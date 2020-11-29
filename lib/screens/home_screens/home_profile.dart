import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/models/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://png.pngtree.com/thumb_back/fh260/background/20190430/pngtree-vector-abstract-perspective-flyer-or-banner-with-white-backgroun-image_110332.jpg'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000),
                  child:
                      Image.asset('lib/assets/userData/defaultUserAvatar.png'),
                ),
              ),
              Consumer<UserCurrent>(
                  builder: (context, user, child) => Text(
                        currentUser.name.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      )),
              Consumer<UserCurrent>(
                  builder: (context, user, child) => Text(
                        currentUser.phoneNo.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
              Consumer<UserCurrent>(
                  builder: (context, user, child) => Text(
                        currentUser.uid.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'im looking for a tutor',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Custombutton1(() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('login', false);
                Navigator.pushNamed(context, "/welcome");
              }, "Sign Out"),
            ],
          ),
        ),
      ),
    );
  }
}
