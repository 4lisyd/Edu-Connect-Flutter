import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_connect/models/storage.dart';

class SearchResult extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  Storage _storage = Storage();

  String location;
  String subject;

  SearchResult(this.location, this.subject) {}

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
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.all(10),
                // decoration: BoxDecoration(
                //   color: Theme.of(context).primaryColorDark,
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: StreamBuilder(
                  stream: firestoreInstance
                      .collection("tutors")
                      // .where("subjectsPreferred.$subject", isEqualTo: true)
                      // .where("area", isEqualTo: location)
                      .get()
                      .asStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, item) {
                        print('lll');
                        print(snapshot.data.docs.length);
                        print('lll');
                        return MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Stack(
                            children: [
                              Container(
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                padding: EdgeInsets.all(20),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
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
                                                })),
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
                                                .bodyText2,
                                            // textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(),
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
