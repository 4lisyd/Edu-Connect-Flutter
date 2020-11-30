import 'package:flutter/material.dart';
import 'package:edu_connect/components/homeblocks.dart';

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
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Choose tutor by City.",
                    style: Theme.of(context).textTheme.headline1,
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
                      print("ok");
                      print(list_searchbycityblock[0]);
                      final item = list_searchbycityblock[index];

                      return Container(
                        margin: EdgeInsets.all(20),
                        color: Colors.greenAccent,
                        width: 220,
                        height: 500,
                        child: ClipRRect(
                          child: Column(
                            children: [
                              Text(
                                list_searchbycityblock[index].title,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Choose tutor by Subject.",
                    style: Theme.of(context).textTheme.headline1,
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
                          color: Colors.greenAccent,
                          width: 220,
                          height: 500,
                          child: Column(
                            children: [
                              Text(
                                list_searchbysubjectblock[index].title,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(
                                height: 50,
                              ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Choose tutor by Test Prep.",
                    style: Theme.of(context).textTheme.headline1,
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
                          color: Colors.greenAccent,
                          width: 220,
                          height: 500,
                          child: Column(
                            children: [
                              Text(
                                list_searchbysubjectblock[index].title,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(
                                height: 50,
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
