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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        LottieBuilder.asset(
                            'lib/assets/animations/lotties/coming_soon.json'),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Edu-Connect Groups',style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 18,fontWeight: FontWeight.w300),textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('meanwhile scroll down to checkout our guide for hiring the best tutors.',style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),textAlign: TextAlign.start,),
                        ),

                      ],
                    ),
                  ),
                  Center(child: Text("15 Best Tips to Choose a Tutor",style: Theme.of(context).textTheme.headline1,)),
                  SizedBox(height: 20,),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("1. Look carefully at your child’s academic strengths and weaknesses",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("2. Keep Your Child’s Learning Style in Mind",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("3. Get References from Other Parents",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("4. Determine Budget and Availability of Your Tutor",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("5. Consider Your Tutor’s Experience and Qualifications",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("6. Choose Which is Best, Online or in Person",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("7. Consider a Tutoring Agency Instead of an Individual Tutor",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("8. Get Your Child’s Buy-in When You Choose a Tutor",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("9. Insist on Monthly Progress Reports and More Often if Needed",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("10. Decide on a Cancellation Policy in Advance",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("11. Ask What Homework Will be Required and Follow Up on Homework Each Session",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("12. Create a Support Network About Tutoring for Your Child ",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("13. Tell the Tutor You Will be Observing One or Two Lessons",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("14. Ask What Type of Pre and Post Assessment the Tutor Will Give Your Child Before They Begin Tutoring",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                      Text("15. Make Tutoring Fun and Celebrate Milestones With Your Child",style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),

                    ],),
                  ),



                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
