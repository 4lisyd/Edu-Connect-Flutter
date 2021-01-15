import 'dart:io';

import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/components/dialog_box.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/my_tutorprofile.dart';
import 'package:edu_connect/screens/sign_up_user/tutor_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edu_connect/models/storage.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:edu_connect/screens/my_tutorprofile.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  File _image;
  Storage _storage = Storage();

  @override
  Widget build(BuildContext context) {
    UserCurrent currentUser_bloc = Provider.of<UserCurrent>(context);
    UserCurrent currentUser_bloc_NL =
        Provider.of<UserCurrent>(context, listen: false);

    // currentUser_bloc.setProfileImage(currentUser_bloc_NL.profilePhotoAsset);

    Future<void> getGalleryImage() async {
      _image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 10);
    }

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 3.7,
                      child: ClipOval(
                          child: FutureBuilder(
                              future: _storage.getImage(currentUser_bloc.uid),
                              builder: (context, snapshot) {
                                // print("sdss");
                                if (snapshot.hasData) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image.network(
                                      snapshot.data,
                                      fit: BoxFit.fill,
                                      height: 500,
                                    ),
                                  );
                                } else {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                          "lib/assets/userData/defaultUserAvatar.png"),
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.amberAccent,
                                      ),
                                    ],
                                  );
                                }
                              })),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          FlatButton(
                            onPressed: () async {
                              await getGalleryImage();
                              await _storage.uploadImage(
                                  _image, currentUser_bloc_NL.uid);

                              String profilePhotoAssetTemp = await _storage
                                  .getImage(currentUser_bloc_NL.uid);
                              currentUser_bloc_NL
                                  .setProfileImage(profilePhotoAssetTemp);
                            },
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.black45,
                              size: 40,
                            ),
                          ),
                          Text(
                            "Add photo",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    currentUser_bloc.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                // Consumer<UserCurrent>(
                //   builder: (context, user, child) => Text(
                //     currentUser1.name != null
                //         ? currentUser1.name.toString()
                //         : "null",
                //     style: Theme.of(context).textTheme.headline1,
                //   ),
                // ),

                Text(
                  currentUser_bloc != null
                      ? currentUser_bloc.uid.toString()
                      : "nugll",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                // Text(
                //   currentUser_bloc != null
                //       ? currentUser_bloc_NL.phoneNo.toString()
                //       : "null",
                //   style: Theme.of(context).textTheme.bodyText1,
                // ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Provider.of<UserCurrent>(context, listen: false).isTutor
                        ? Text(
                            'im a tutor looking for students',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            'im a Guardian looking for a Tutor',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                // if its already tutor itll go there to update info else it will sign up new user.

                Provider.of<UserCurrent>(context).isTutor
                    ? Custombutton1(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyTutorProfile(currentUser_bloc_NL.uid)));
                        // MyTutorProfile(currentUser_bloc_NL.uid)
                      }, "My Tutor profile")
                    : Custombutton1(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TutorSignUp(false)));
                      }, "Register As A Tutor"),
                SizedBox(
                  height: 20,
                ),

                Custombutton1(() async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('login', false);
                  Navigator.pushNamed(context, "/welcome");
                }, "Sign Out"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
