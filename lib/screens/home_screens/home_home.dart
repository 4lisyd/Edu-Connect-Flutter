import 'package:edu_connect/components/animations.dart';
import 'package:edu_connect/screens/search_result/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:edu_connect/components/homeblocks.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/components/search_criteria.dart';

class HomeHome extends StatefulWidget {
  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  var _selectedLocation;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference locations_firestore =
      FirebaseFirestore.instance.collection('locations').doc('qatar');
  String _location;

  @override
  Widget build(BuildContext context) {
    UserCurrent currentUser_bloc_NL =
        Provider.of<UserCurrent>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                //  animationText_Gradient("Let's Find a Tutor,"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 0,
                      ),
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              print('search clicked...');
                              return SearchCriteria();
                            },
                          );
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            "Search Through the catalog",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                //animationText_Gradient("You Always Wanted."),

                // area search...
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     // Icon(Icons.location_on_outlined),
                //     Container(
                //       height: 50,
                //       child: FutureBuilder<DocumentSnapshot>(
                //         future: FirebaseFirestore.instance
                //             .collection('location')
                //             .doc('qatar')
                //             .get(),
                //         builder: (context, snapshot) {
                //           // print(snapshot.data['locations'].toString());
                //
                //           if (snapshot.hasData) {
                //             var dropdownList = snapshot.data['locations'];
                //             print(dropdownList);
                //             List<dynamic> _locations = dropdownList;
                //
                //             return Row(
                //               mainAxisSize: MainAxisSize.max,
                //               children: [
                //                 FlatButton(
                //                   materialTapTargetSize:
                //                       MaterialTapTargetSize.shrinkWrap,
                //                   padding: EdgeInsets.zero,
                //                   child: Icon(Icons.cancel),
                //                   onPressed: () {
                //                     setState(() {
                //                       _selectedLocation = null;
                //                       _location = null;
                //                       currentUser_bloc_NL.locationString = null;
                //                     });
                //                   },
                //                 ),
                //                 DropdownButton(
                //                   onChanged: (value) {
                //                     setState(() {
                //                       _selectedLocation = value;
                //                       _location = value;
                //                       currentUser_bloc_NL.locationString =
                //                           value;
                //                     });
                //                   },
                //                   hint: Text(
                //                     "Choose Area",
                //                     style:
                //                         Theme.of(context).textTheme.bodyText1,
                //                   ),
                //                   icon: Icon(Icons.location_on_outlined),
                //                   value: _selectedLocation,
                //                   items: _locations.map((location) {
                //                     return DropdownMenuItem(
                //                       child: Text(location),
                //                       value: location,
                //                     );
                //                   }).toList(),
                //                 ),
                //               ],
                //             );
                //           } else
                //             return Text('');
                //         },
                //       ),
                //     )
                //   ],
                // ),

                // Container(
                //   padding: EdgeInsets.only(left: 20),
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     "By City.",
                //     style: Theme.of(context)
                //         .textTheme
                //         .headline1
                //         .copyWith(shadows: [
                //       Shadow(
                //           blurRadius: 40,
                //           offset: Offset(0, 10),
                //           color: Colors.amberAccent),
                //     ]),
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                // Container(
                //   height: 200,
                //   //margin: EdgeInsets.symmetric(vertical: 20.0),
                //   child: StreamBuilder<Object>(
                //       stream: null,
                //       builder: (context, snapshot) {
                //         return ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemCount: list_searchbycityblock.length,
                //           itemBuilder: (context, index) {
                //             final item = list_searchbycityblock[index];
                //
                //             return FlatButton(
                //               onPressed:
                //                   list_searchbycityblock[index].onPressFunc,
                //               child: Container(
                //                 margin: EdgeInsets.all(20),
                //                 decoration: BoxDecoration(
                //                   color: Theme.of(context).primaryColor,
                //                   borderRadius: BorderRadius.circular(15),
                //                 ),
                //                 width: 220,
                //                 height: 500,
                //                 child: ClipRRect(
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.center,
                //                     children: [
                //                       Flexible(
                //                         child: Stack(
                //                           alignment: Alignment.topRight,
                //                           children: [
                //                             Center(
                //                               child: Container(
                //                                 color: Theme.of(context)
                //                                     .primaryColor,
                //                                 height: 10,
                //                               ),
                //                             ),
                //                             Image.asset(
                //                               list_searchbycityblock[index]
                //                                   .imageAsset,
                //                               fit: BoxFit.fill,
                //                             ),
                //                             Center(
                //                               child: Text(
                //                                 list_searchbycityblock[index]
                //                                     .title,
                //                                 style: Theme.of(context)
                //                                     .textTheme
                //                                     .headline1,
                //                                 textAlign: TextAlign.start,
                //                               ),
                //                             )
                //                           ],
                //                         ),
                //                       ),
                //                       // SizedBox(
                //                       //   height: 50,
                //                       // ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //           // children: [
                //           //   Row(
                //           //     children: [
                //           //       Container(
                //           //         child: Text('test'),
                //           //         color: Colors.blue,
                //           //         width: 400,
                //           //         height: 100,
                //           //       ),
                //           //       Container(
                //           //         child: Text('test'),
                //           //         color: Colors.green,
                //           //         width: 400,
                //           //         height: 100,
                //           //       ),
                //           //     ],
                //           //   ),
                //           // ],
                //         );
                //       }),
                // ),
                SizedBox(
                  height: 40,
                ),

                ////////////////////////////////////////////////////////////////
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "By Subject.",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(shadows: [
                      Shadow(
                          blurRadius: 40,
                          offset: Offset(0, 10),
                          color: Colors.amberAccent),
                    ]),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 200,
                  //margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list_searchbysubjectblock.length,
                    itemBuilder: (context, index) {
                      //print("ok");
                      // print(list_searchbycityblock[0]);
                      final item = list_searchbysubjectblock[index];

                      return MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResult(_location,
                                      list_searchbysubjectblock[index].title)));
                        },
                        child: ClipRRect(
                          //  borderRadius: BorderRadius.circular(100),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 220,
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  list_searchbysubjectblock[index].imageAsset,

                                  // "lib/assets/UI_pictures/subject_icons/arabic.png",
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list_searchbysubjectblock[index].title,
                                  style: Theme.of(context).textTheme.headline1,
                                ),

                                // SizedBox(
                                //   height: 50,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ////////////////////////////////////////////////////////////
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "By Test Prep.",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(shadows: [
                      Shadow(
                          blurRadius: 40,
                          offset: Offset(0, 10),
                          color: Colors.amberAccent),
                    ]),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 200,
                  //margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list_searchbysubjectblock.length - 1,
                    itemBuilder: (context, index) {
                      //print("ok");
                      // print(list_searchbycityblock[0]);
                      final item = list_searchbytestprepblock[index];

                      return Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 220,
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              list_searchbytestprepblock[index].title,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
