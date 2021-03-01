// import 'package:edu_connect/components/animations.dart';
import 'package:edu_connect/screens/search_result/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:edu_connect/components/homeblocks.dart';
import 'package:flutter/rendering.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              // colorFilter: ColorFilter.mode(
              //     Theme.of(context).primaryColor.withOpacity(1),
              //     BlendMode.colorBurn),
              image: AssetImage(
                'lib/assets/background_img/tiles_bg6.jpg',
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                SizedBox(
                  height: 40,
                ),

                ////////////////////////////////////////////////////////////////
                Container(
                  width: 200,
                  height: 50,
                  // margin: EdgeInsets.only(left: 20),
                  // padding: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "By Subject.",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        shadows: [
                          Shadow(
                              blurRadius: 40,
                              offset: Offset(0, 7),
                              color: Colors.black),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
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
                                  builder: (context) => SearchResult(
                                      context.read<UserCurrent>().locationString,
                                      list_searchbysubjectblock[index].title,
                                      'subject')));
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
                  height: 20,
                ),
                ////////////////////////////////////////////////////////////

                Container(
                  width: 200,
                  height: 50,
                  // margin: EdgeInsets.only(left: 20),
                  // padding: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "By Test Prep.",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        shadows: [
                          Shadow(
                              blurRadius: 40,
                              offset: Offset(0, 7),
                              color: Colors.black),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
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

                      return FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResult(
                                  _location,
                                  list_searchbytestprepblock[index].title,
                                  'test'),
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
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
                              Text(
                                list_searchbytestprepblock[index].title,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ],
                          ),
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
