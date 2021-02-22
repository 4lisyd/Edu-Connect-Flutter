import 'package:edu_connect/screens/search_result/profileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/storage.dart';

class SearchResult extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  Storage _storage = Storage();

  String location;
  String subject;
  String searchBy;

  var locationList = [];
  var subjectList = [];
  var SearchByList = [];

  SearchResult(this.location, this.subject, this.searchBy);

  cal_days_avail(Map<String, bool> daysAvailable) {
    int counter = 0;

    for (bool item in daysAvailable.values) {
      if (item == true) {
        counter += 1;
      }
    }
    return counter;
  }

  FirebaseFirestore parentRef = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Text(
                  "...showing results for tutors in $location who teach $subject.",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: firestoreInstance
                      .collection("tutors")
                      .where("${searchBy}sPreferred.${subject}",
                          isEqualTo: true)
                      .where("area", isEqualTo: location)
                      .get()
                      .asStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, item) {
                          return MaterialButton(
                            padding: EdgeInsets.zero,
                            splashColor: Theme.of(context).accentColor,
                            onPressed: () {
                              print('profile view pressed');
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProfileView(
                                              snapshot.data.docs[item].id)));
                            },
                            child: Stack(
                              children: [
                                Hero(
                                  tag: 'yellowbox_profileview',
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    margin: EdgeInsets.only(left: 8),
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      bottom: 20, left: 20, top: 10),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      )),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                              child: Hero(
                                            tag: 'profilepic',
                                            child: FutureBuilder(
                                                future: _storage.getImage(
                                                    snapshot
                                                        .data.docs[item].id),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return CircleAvatar(
                                                      radius: 30.0,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Image.network(
                                                        snapshot.data,
                                                        // height: 30,
                                                        fit: BoxFit.fill,
                                                        height: 500,
                                                      ),
                                                    );
                                                  } else {
                                                    return Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Image.asset(
                                                          "lib/assets/userData/defaultUserAvatar.png",
                                                          height: 57,
                                                        ),
                                                        CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors
                                                                  .amberAccent,
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                }),
                                          )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              // snapshot.data.docs[item].id,
                                              snapshot.data.docs[item]
                                                  .data()['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                              textAlign: TextAlign.start,
                                            ),
                                            // child: FutureBuilder(
                                            //     future: parentRef
                                            //         .collection('parents')
                                            //         .doc(snapshot
                                            //             .data.docs[item]
                                            //             .data()['uid'])
                                            //         .get(),
                                            //     builder: (context, snapshot) {
                                            //       if (snapshot.hasData) {
                                            //         return Text(
                                            //           snapshot.data
                                            //               .data()['name'],
                                            //           style: Theme.of(context)
                                            //               .textTheme
                                            //               .headline1,
                                            //           textAlign:
                                            //               TextAlign.start,
                                            //         );
                                            //       }
                                            //       return Container();
                                            //     }),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),

                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            // gradient: new LinearGradient(
                                            //   colors: [Colors.red, Colors.cyan],
                                            // ),
                                            ),
                                        child: Text(
                                          // snapshot.data.docs[item].id,
                                          snapshot.data.docs[item]
                                                  .data()['bio']
                                                  .toString()
                                                  .substring(0, 70) +
                                              "...",

                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(fontSize: 13),
                                          textAlign: TextAlign.justify,

                                          // textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Wrap(
                                        children: [
                                          Chip(
                                            label: Text(snapshot.data.docs[item]
                                                .data()['area']),
                                            avatar: Icon(
                                                Icons.location_on_outlined),
                                            padding: EdgeInsets.only(
                                                left: -2, right: 0),
                                          ),
                                          SizedBox(width: 5),
                                          Chip(
                                            label: Text(
                                              "" +
                                                  cal_days_avail(Map<String,
                                                          bool>.from(snapshot
                                                              .data.docs[item]
                                                              .data()[
                                                          'daysAvailability']))
                                                      .toString() +
                                                  " days a week",
                                            ),
                                            avatar: Icon(
                                              Icons.timer,
                                            ),
                                            padding: EdgeInsets.only(
                                                left: -2, right: 6),
                                          ),
                                          // Chip(
                                          //   label: Text(snapshot.data.docs[item]
                                          //       .data()['email']),
                                          //   avatar: Icon(Icons.email),
                                          //   padding: EdgeInsets.only(
                                          //       left: 20, right: 20),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator(
                        strokeWidth: 7,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
