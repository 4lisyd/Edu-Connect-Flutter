import 'package:edu_connect/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edu_connect/components/buildTogglesW.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'dart:core';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:edu_connect/models/storage.dart';
import 'package:edu_connect/models/user.dart';
import 'package:provider/provider.dart';
import 'package:edu_connect/components/textfield.dart';
import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/components/radiotiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/tutor.dart';

class TutorSignUp extends StatefulWidget {
  TutorSignUp(this.alreadyTutor);
  bool alreadyTutor;

  @override
  _TutorSignUpState createState() => _TutorSignUpState();
}

class _TutorSignUpState extends State<TutorSignUp> {
  File _image;
  Storage _storage = Storage();

  TextEditingController textEditingController_name;
  TextEditingController textEditingController_email;
  TextEditingController textEditingController_bio;

  final CollectionReference ParentsCollection =
      FirebaseFirestore.instance.collection("parents");
  final CollectionReference TutorsCollection =
      FirebaseFirestore.instance.collection("tutors");

  var _selectedLocation;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference locations_firestore =
      FirebaseFirestore.instance.collection('locations');
  String _location;

  initState() {
    super.initState();
    //_storage = Storage();
  }

  Future getGalleryImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image.toString());

    setState(() {
      _image = image;
    });
  }

  Future<DocumentSnapshot> getAlreadyTutorInfo(BuildContext context) async {
    var TutorsCollection_temp;
    TutorsCollection_temp = await TutorsCollection.doc(
            Provider.of<UserCurrent>(context, listen: false).uid)
        .get();
    print('oasodoasdasdasodaosdaosdosa');
    print('oasodoasdasdasodaosdaosdosa');
    return TutorsCollection_temp;
    print(TutorsCollection_temp.toString());
  }

  @override
  Widget build(BuildContext context) {
    UserCurrent currentUser_bloc = Provider.of<UserCurrent>(context);
    UserCurrent currentUser_bloc_NL =
        Provider.of<UserCurrent>(context, listen: false);

    Tutor tutor_bloc = Provider.of<Tutor>(context);
    Tutor tutor_bloc_NL = Provider.of<Tutor>(context, listen: false);

    UserSign_Tutor userSign_Tutor = UserSign_Tutor(
      currentUser_bloc_NL.uid,
    );

    // todo: make sure that bio is more than 70 words

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    widget.alreadyTutor
                        ? 'Edit Your information'
                        : ' Sign Up as a tutor Today!',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                            if (snapshot.hasData) {
                              return CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(
                                  snapshot.data,
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
                          },
                        ),
                      ),
                    ),
                    Positioned(
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
                              size: 35,
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
                SizedBox(
                  height: 10,
                ),
                customTextField1(
                  "Enter name",
                  TextInputType.text,
                  textEditingController_name,
                  (value) {
                    tutor_bloc_NL.name = value;
                  },
                  leading_icon: Icon(Icons.face),
                ),
                SizedBox(
                  height: 10,
                ),
                customTextField1(
                  "Enter email",
                  TextInputType.emailAddress,
                  textEditingController_email,
                  (value) {
                    tutor_bloc_NL.email = value;
                  },
                  leading_icon: Icon(Icons.email_outlined),
                ),
                CustomRadioTiles_gender(),
                Container(
                  height: 200,
                  child: customTextField1(
                    "Set Bio \n\n\n i.e i have 2 years of experience \n in teaching algebra",
                    TextInputType.multiline,
                    textEditingController_bio,
                    (value) {
                      tutor_bloc_NL.bio = value;
                    },
                    leading_icon: Icon(Icons.description_outlined),
                  ),
                )
                // Text(
                //   "enter your date of birth",
                //   style: Theme.of(context).textTheme.bodyText1,
                //   textAlign: TextAlign.left,
                // ),
                ,
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('location')
                        .doc('qatar')
                        .get(),
                    builder: (context, snapshot) {
                      // print(snapshot.data['locations'].toString());
                      var dropdownList = snapshot.data['locations'];
                      print(dropdownList);
                      List<dynamic> _locations = dropdownList;

                      return DropdownButton(
                        onChanged: (value) {
                          setState(() {
                            _selectedLocation = value;
                            _location = value;
                          });
                        },
                        hint: Text(
                          "Choose Area",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        icon: Icon(Icons.location_on_outlined),
                        value: _selectedLocation,
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: Text(location),
                            value: location,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Days of the week available",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTogglesW(tutor_bloc.daysAvailable),

                /////////////// provider pattern for this logic all saves to Tutor where it signs up as well as uploads everything to cloud firebase reduce clutter btw user sign up User and tutor and Tutor sign up Read more about OOP
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Subjects Preferred",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTogglesW(tutor_bloc.subjectPreferred),

                SizedBox(
                  height: 30,
                ),
                Text(
                  "Tests Preferred",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTogglesW(tutor_bloc.testPreferred),

                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you currently ",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 17),
                    ),
                    buildTogglesW(tutor_bloc.areYou)
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Custombutton1(
                  () {
                    // print(tutor_bloc_NL.email);
                    // print(tutor_bloc_NL.area);
                    // tutor_bloc_NL.area = _location;
                    // print(tutor_bloc_NL.area);

                    userSign_Tutor.registerNewUser(tutor_bloc_NL);
                    Provider.of<UserCurrent>(context, listen: false).isTutor =
                        true;
                    ParentsCollection.doc(
                            Provider.of<UserCurrent>(context, listen: false)
                                .uid)
                        .update({"tutor": true});
                    Navigator.pop(context);

                    // any tutor is also a parent
                  },
                  "Submit",
                  // buttonColor: Theme.of(context).accentColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
