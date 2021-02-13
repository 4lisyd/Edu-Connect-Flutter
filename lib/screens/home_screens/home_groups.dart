import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeGroups extends StatefulWidget {
  @override
  _HomeGroupsState createState() => _HomeGroupsState();
}

class _HomeGroupsState extends State<HomeGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: NetworkImage(
        //         'https://png.pngtree.com/thumb_back/fh260/background/20190430/pngtree-vector-abstract-perspective-flyer-or-banner-with-white-backgroun-image_110332.jpg'),
        //   ),
        // ),
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: LottieBuilder.asset(
                'lib/assets/animations/lotties/coming_soon.json'),
          ),
        ),
      ),
    );
  }
}
