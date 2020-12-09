import 'package:flutter/material.dart';
import 'package:edu_connect/components/homeblocks.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHome extends StatefulWidget {
  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Pick out a Tutor!",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 40, shadows: [
                      Shadow(
                          blurRadius: 40,
                          offset: Offset(0, 10),
                          color: Colors.amberAccent),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  thickness: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "By City.",
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
                    itemCount: list_searchbycityblock.length,
                    itemBuilder: (context, index) {
                      final item = list_searchbycityblock[index];

                      return FlatButton(
                        onPressed: list_searchbycityblock[index].onPressFunc,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 220,
                          height: 500,
                          child: ClipRRect(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Center(
                                        child: Container(
                                          color: Theme.of(context).primaryColor,
                                          height: 10,
                                        ),
                                      ),
                                      Image.asset(
                                        list_searchbycityblock[index]
                                            .imageAsset,
                                        fit: BoxFit.fill,
                                      ),
                                      Center(
                                        child: Text(
                                          list_searchbycityblock[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    ],
                                  ),
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
                    // children: [
                    //   Row(
                    //     children: [
                    //       Container(
                    //         child: Text('test'),
                    //         color: Colors.blue,
                    //         width: 400,
                    //         height: 100,
                    //       ),
                    //       Container(
                    //         child: Text('test'),
                    //         color: Colors.green,
                    //         width: 400,
                    //         height: 100,
                    //       ),
                    //     ],
                    //   ),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 50,
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

                      return ClipRRect(
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
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
                    itemCount: list_searchbysubjectblock.length,
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
