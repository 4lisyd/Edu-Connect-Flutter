import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:core';

class buildDaysAvailibilityW extends StatefulWidget {
  @override
  _buildDaysAvailibilityWState createState() => _buildDaysAvailibilityWState();

  Map<String, bool> daysAvailable;
  buildDaysAvailibilityW(this.daysAvailable);
}

class _buildDaysAvailibilityWState extends State<buildDaysAvailibilityW> {
  @override
  Widget build(BuildContext context) {
    var daysAvailable = widget.daysAvailable;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Monday",
                        style: Theme.of(context).textTheme.bodyText1),
                    Checkbox(
                        value: daysAvailable['Monday'],
                        onChanged: (value) {
                          setState(() {
                            daysAvailable['Monday'] =
                                daysAvailable['Monday'] ? false : true;
                          });
                        }),
                    Text("Tuesday",
                        style: Theme.of(context).textTheme.bodyText1),
                    Checkbox(
                        value: daysAvailable['Tuesday'],
                        onChanged: (value) {
                          setState(() {
                            daysAvailable['Tuesday'] =
                                daysAvailable['Tuesday'] ? false : true;
                          });
                        }),
                    Text("Wednesday",
                        style: Theme.of(context).textTheme.bodyText1),
                    Checkbox(
                        value: daysAvailable['Wednesday'],
                        onChanged: (value) {
                          setState(() {
                            daysAvailable['Wednesday'] =
                                daysAvailable['Wednesday'] ? false : true;
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Thursday", style: Theme.of(context).textTheme.bodyText1),
              Checkbox(
                  value: daysAvailable['Thursday'],
                  onChanged: (value) {
                    setState(() {
                      daysAvailable['Thursday'] =
                          daysAvailable['Thursday'] ? false : true;
                    });
                  }),
              Text("Friday", style: Theme.of(context).textTheme.bodyText1),
              Checkbox(
                  value: daysAvailable['Friday'],
                  onChanged: (value) {
                    setState(() {
                      daysAvailable['Friday'] =
                          daysAvailable['Friday'] ? false : true;
                    });
                  }),
              Text("Saturday", style: Theme.of(context).textTheme.bodyText1),
              Checkbox(
                  value: daysAvailable['Saturday'],
                  onChanged: (value) {
                    setState(() {
                      daysAvailable['Saturday'] =
                          daysAvailable['Saturday'] ? false : true;
                    });
                  }),
              Text("Sunday", style: Theme.of(context).textTheme.bodyText1),
              Checkbox(
                  value: daysAvailable['Sunday'],
                  onChanged: (value) {
                    setState(() {
                      daysAvailable['Sunday'] =
                          daysAvailable['Sunday'] ? false : true;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

//
//
// Column buildDaysAvailibilityW(
//     BuildContext context, Map<String, bool> daysAvailable) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             child: Row(
//               children: [
//                 Text("Monday", style: Theme.of(context).textTheme.bodyText1),
//                 Checkbox(
//                     value: daysAvailable['Monday'],
//                     onChanged: (value) {
//                       setState(() {
//                         daysAvailable['Monday'] =
//                         daysAvailable['Monday'] ? false : true;
//                       });
//                     }),
//                 Text("Tuesday", style: Theme.of(context).textTheme.bodyText1),
//                 Checkbox(
//                     value: daysAvailable['Tuesday'],
//                     onChanged: (value) {
//                       setState(() {
//                         daysAvailable['Tuesday'] =
//                         daysAvailable['Tuesday'] ? false : true;
//                       });
//                     }),
//                 Text("Wednesday",
//                     style: Theme.of(context).textTheme.bodyText1),
//                 Checkbox(
//                     value: daysAvailable['Wednesday'],
//                     onChanged: (value) {
//                       setState(() {
//                         daysAvailable['Wednesday'] =
//                         daysAvailable['Wednesday'] ? false : true;
//                       });
//                     }),
//               ],
//             ),
//           ),
//         ],
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Thursday", style: Theme.of(context).textTheme.bodyText1),
//           Checkbox(
//               value: daysAvailable['Thursday'],
//               onChanged: (value) {
//                 setState(() {
//                   daysAvailable['Thursday'] =
//                   daysAvailable['Thursday'] ? false : true;
//                 });
//               }),
//           Text("Friday", style: Theme.of(context).textTheme.bodyText1),
//           Checkbox(
//               value: daysAvailable['Friday'],
//               onChanged: (value) {
//                 setState(() {
//                   daysAvailable['Friday'] =
//                   daysAvailable['Friday'] ? false : true;
//                 });
//               }),
//           Text("Saturday", style: Theme.of(context).textTheme.bodyText1),
//           Checkbox(
//               value: daysAvailable['Saturday'],
//               onChanged: (value) {
//                 setState(() {
//                   daysAvailable['Saturday'] =
//                   daysAvailable['Saturday'] ? false : true;
//                 });
//               }),
//           Text("Sunday", style: Theme.of(context).textTheme.bodyText1),
//           Checkbox(
//               value: daysAvailable['Sunday'],
//               onChanged: (value) {
//                 setState(() {
//                   daysAvailable['Sunday'] =
//                   daysAvailable['Sunday'] ? false : true;
//                 });
//               }),
//         ],
//       ),
//     ],
//   );
// }
// }
