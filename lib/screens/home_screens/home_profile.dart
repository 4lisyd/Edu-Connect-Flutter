import 'dart:io';

import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/components/dialog_box.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/sign_up_user/tutor_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edu_connect/models/storage.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  File _image;
  Storage _storage = Storage();

  Future getImage() async {
    // ignore: deprecated_member_use
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('aaOK');

    print(_image.toString());
    print('aaOK');
    await _storage.uploadImage(_image, currentUser1.uid.toString());
    setState(() {
      _image = _image;
    });
  }

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
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 3.7,
                    child: ClipOval(
                      child: currentUser1.profilePhotoAsset == null
                          ? Stack(alignment: Alignment.center, children: [
                              Image.asset(
                                "lib/assets/userData/defaultUserAvatar.png",
                                fit: BoxFit.fill,
                              ),
                              CircularProgressIndicator(),
                            ])
                          : Image.network(
                              currentUser1.profilePhotoAsset,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () async {
                            await getImage();

                            await _storage.uploadImage(
                                _image, currentUser1.uid);

                            String profilePhotoAsset_temp =
                                await _storage.getImage(currentUser1.uid);

                            setState(() {
                              ///////////////////////////////////////////////

                              print('ddfd');
                              print(profilePhotoAsset_temp);
                              currentUser1.profilePhotoAsset =
                                  profilePhotoAsset_temp;
                              print('ddfd');
                            });
                          },
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
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
                  currentUser1.name,
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
                currentUser1 != null ? currentUser1.uid.toString() : "null",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                currentUser1 != null ? currentUser1.phoneNo.toString() : "null",
                style: Theme.of(context).textTheme.bodyText1,
              ),

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
              SizedBox(
                height: 50,
              ),

              Custombutton1(() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('login', false);
                Navigator.pushNamed(context, "/welcome");
              }, "Sign Out"),

              SizedBox(
                height: 20,
              ),
              Custombutton1(() async {
                if (currentUser1.profilePhotoAsset == null) {
                  print('ok');
                  showDialog(
                    context: context,
                    builder: (_) =>
                        customDialogBox1("please upload your profile picture"),
                  );
                  return;
                }

                Navigator.pushNamed(context, "/tutorsignup");
              }, "Register As A Tutor"),
            ],
          ),
        ),
      ),
    );
  }
}
