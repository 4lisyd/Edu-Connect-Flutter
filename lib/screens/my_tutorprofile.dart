import 'package:edu_connect/components/buildTogglesW.dart';
import 'package:edu_connect/components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edu_connect/models/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//https://pub.dev/packages/flutter_phone_direct_caller
import 'package:flutter_email_sender/flutter_email_sender.dart';
//https://pub.dev/packages/flutter_email_sender/install
import 'package:edu_connect/screens/sign_up_user/tutor_signup.dart';

class MyTutorProfile extends StatelessWidget {
  String tid;

  MyTutorProfile(this.tid);

  final Email email = Email(
    body: "_bodyController.text",
    subject: "_subjectController.text",
    recipients: [],
    attachmentPaths: [],
    isHTML: true,
  );

  //
  // for (var i = cal_stars(snapshot
  //     .data.docs[item]
  //     .data()['ratings']);
  // i >= 1;
  // i--) {
  // Icon(Icons.star);
  // }
  //
  //
  cal_stars(List<dynamic> numbers) {
    int temp_counter1 = 0;
    int temp_counter2 = 0;
    for (int item in numbers) {
      temp_counter1 += item;
      temp_counter2 += 1;
    }

    return (temp_counter1 / temp_counter2).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;

    var tutorRef = firestoreInstance.collection('tutors').doc(tid);

    Storage _storage = Storage();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: StreamBuilder<DocumentSnapshot>(
              stream: tutorRef.get().asStream(),
              builder: (context, snapshot) {
                print("snapshot.datadatadata");
                // print(snapshot.data.data()['daysAvailability']);
                print("snapshot.datadatadata");
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Hero(
                              tag: 'yellowbox_profileview',
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 30,
                              child: ClipOval(
                                  child: Hero(
                                tag: 'profilepic',
                                child: FutureBuilder(
                                    future: _storage.getImage(tid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 60.0,
                                              backgroundColor: Colors.white,
                                              child: Image.network(
                                                snapshot.data,
                                                // height: 30,
                                                fit: BoxFit.fill,
                                                height: 500,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else
                                        return CircleAvatar(
                                          radius: 60.0,
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor:
                                                  Colors.transparent,
                                              value: 20,
                                            ),
                                          ),
                                        );
                                    }),
                              )),
                            ),
                            Positioned(
                              top: 35,
                              left: 170,
                              child: Text(
                                snapshot.data.data()['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(fontSize: 25),
                              ),
                            ),
                            Positioned(
                              top: 75,
                              left: 170,
                              child: Container(
                                width: 200,
                                child: Builder(
                                  builder: (BuildContext context) {
                                    return Row(
                                      children: [
                                        // cal_stars(snapshot.data
                                        // .data()['ratings']
                                        for (int i = 1;
                                            i <=
                                                cal_stars(snapshot.data
                                                    .data()['ratings']);
                                            i++)
                                          Icon(Icons.star),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75,
                              left: 170,
                              child: Container(
                                width: 200,
                                child: Builder(
                                  builder: (BuildContext context) {
                                    return Row(
                                      children: [
                                        for (int i = 1; i <= 5; i++)
                                          Icon(Icons
                                              .star_border_purple500_sharp),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Theme.of(context).primaryColor),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Bio',
                              style: Theme.of(context).textTheme.headline1,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.data.data()['bio']),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Days Available',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            buildTogglesW_ViewOnly(Map<String, bool>.from(
                                snapshot.data.data()['daysAvailability'])),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Subjects Preferred',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            buildTogglesW_ViewOnly(Map<String, bool>.from(
                                snapshot.data.data()['subjectsPreferred'])),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Tests Preferred',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            buildTogglesW_ViewOnly(
                              Map<String, bool>.from(
                                snapshot.data.data()['testsPreferred'],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            MaterialButton(
                              elevation: 20,
                              padding: EdgeInsets.all(15),
                              height: 40,
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'note',
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Container(
                                          child: Text(
                                              'you have to resubmit your registration form'),
                                        ),
                                        actions: [
                                          MaterialButton(
                                            elevation: 20,
                                            padding: EdgeInsets.all(15),
                                            height: 40,
                                            color:
                                                Theme.of(context).accentColor,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TutorSignUp(false)));
                                            },
                                            child: Text('Ok'),
                                          )
                                        ],
                                      );
                                    });
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TutorSignUp(false)));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  'Edit Profile',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
