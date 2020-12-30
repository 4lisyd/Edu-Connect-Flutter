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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  "$location $subject",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: StreamBuilder(
                  stream: firestoreInstance
                      .collection("tutors")
                      .where("subjectsPreferred.$subject", isEqualTo: true)
                      .where("area", isEqualTo: location)
                      .get()
                      .asStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, item) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                    child: FutureBuilder(
                                        future: _storage.getImage(
                                            snapshot.data.docs[item].id),
                                        builder: (context, snapshot) {
                                          // print("sdss");
                                          if (snapshot.hasData) {
                                            return CircleAvatar(
                                              radius: 30.0,
                                              backgroundColor: Colors.white,
                                              child: Image.network(
                                                snapshot.data,
                                                // height: 30,
                                                fit: BoxFit.fill,
                                                height: 500,
                                              ),
                                            );
                                          } else {
                                            return Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  "lib/assets/userData/defaultUserAvatar.png",
                                                  height: 37,
                                                ),
                                                CircularProgressIndicator(
                                                  backgroundColor:
                                                      Colors.amberAccent,
                                                ),
                                              ],
                                            );
                                          }
                                        })),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    // snapshot.data.docs[item].id,
                                    snapshot.data.docs[item].data()['name'],
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                    // textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
