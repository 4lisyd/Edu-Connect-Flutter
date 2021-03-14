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

    _storage.getImageCached(currentUser_bloc_NL.uid);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 30),
                  ),
                  Divider(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // todo: make this PP cached using a string somehow from _storage.getimage we have to get a string future builder messes it up.

                      //////////////////////////end of the beta PP
                      // Positio(child: Container()),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.height / 4,
                        // decoration: BoxDecoration(),
                        child: FutureBuilder(
                            future: _storage.getImage(currentUser_bloc.uid),
                            builder: (context, snapshot) {
                              // print("sdss");
                              if (snapshot.hasData) {
                                return CircleAvatar(
                                  // backgroundImage: NetworkImage(snapshot.data,),
                                  backgroundImage:
                                      CachedNetworkImageProvider(snapshot.data),
                                  radius: MediaQuery.of(context).size.width,
                                );
                              } else {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "lib/assets/userData/defaultUserAvatar.png"),
                                      radius: MediaQuery.of(context).size.width,
                                    ),
                                    // Image.asset(
                                    //     "lib/assets/userData/defaultUserAvatar.png"),
                                    CircularProgressIndicator(
                                      backgroundColor: Colors.amberAccent,
                                    ),
                                  ],
                                );
                              }
                            }),
                      ),
                      Positioned(
                        bottom: 20,
                        right: -20,
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
                                color: Colors.black38,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 1.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Hi, ',
                            //   style: Theme.of(context).textTheme.headline1,
                            // ),
                            Icon(Icons.face_retouching_natural),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              currentUser_bloc.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                    fontSize: 25,
                                    fontFamily: 'Bangers',
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 80,
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Chip(
                                  padding: EdgeInsets.all(18),
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                  label: Text(
                                    currentUser_bloc != null
                                        ? currentUser_bloc_NL.phoneNo.toString()
                                        : "null",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 12),
                                  ),
                                  avatar: Icon(
                                    Icons.phone_forwarded_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Chip(
                                  padding: EdgeInsets.all(18),
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                  label: Provider.of<UserCurrent>(context,
                                              listen: false)
                                          .isTutor
                                      ? Text(
                                          'looking for students',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          'looking for a Tutor.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                  avatar: Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Provider.of<UserCurrent>(context).isTutor
                            ? Custombutton1(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyTutorProfile(
                                            currentUser_bloc_NL.uid)));
                                // MyTutorProfile(currentUser_bloc_NL.uid)
                              }, "My Tutor Profile")
                            : Custombutton1(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TutorSignUp(false)));
                              }, "Register as a Tutor"),
                        // Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 60,
                              // margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Account Preferences',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ],
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      title: Text(
                                        'Term and Conditons',
                                        textAlign: TextAlign.center,
                                      ),
                                      contentPadding: EdgeInsets.all(50),
                                      children: [
                                        Text(
                                          "You must obey US so we hide these under long pieces of boring texts, You must obey US so we hide these under long pieces of boring texts, You must obey US so we hide these under long pieces of boring texts , You must obey US so we hide these under long pieces of boring texts",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              // margin: EdgeInsets.all(20),
                              height: 60,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Terms and Support',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ],
                              ),
                            )),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    title: Text(
                                      'About',
                                      textAlign: TextAlign.center,
                                    ),
                                    contentPadding: EdgeInsets.all(50),
                                    children: [
                                      Text(
                                        'tell me something about the app i really believe in your idea!tell me something about the app i really believe in your idea!tell me something about the app i really believe in your idea!tell me something about the app i really believe in your idea!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            // margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(10),
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'About',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontSize: 12),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Custombutton1(() async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('login', false);
                          Navigator.pushNamed(context, "/welcome");
                        }, "Sign Out"),
                        SizedBox(
                          height: 20,
                        ),
                        // if its already tutor itll go there to update info else it will sign up new user.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
