import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edu_connect/models/tutor.dart';
import 'dart:core';

class buildTogglesW extends StatefulWidget {
  @override
  _buildTogglesWState createState() => _buildTogglesWState();

  Map<String, bool> daysAvailable;
  buildTogglesW(this.daysAvailable);
}

class _buildTogglesWState extends State<buildTogglesW> {
  @override
  Widget build(BuildContext context) {
    var daysAvailable = widget.daysAvailable;

    return Center(
      child: Wrap(
        children: [
          for (var item in daysAvailable.entries)
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.key, style: Theme.of(context).textTheme.bodyText1),
                  Checkbox(
                      value: item.value,
                      onChanged: (value) {
                        var temp = value;

                        setState(() {
                          daysAvailable[item.key] = item.value ? false : true;
                        });
                      }),
                ],
              ),
            ),
        ],
        alignment: WrapAlignment.center,
      ),
    );

    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             child: Row(
    //               children: [
    //                 Text("Monday",
    //                     style: Theme.of(context).textTheme.bodyText1),
    //                 Checkbox(
    //                     value: daysAvailable['Monday'],
    //                     onChanged: (value) {
    //                       setState(() {
    //                         daysAvailable['Monday'] =
    //                             daysAvailable['Monday'] ? false : true;
    //                       });
    //                     }),
    //                 Text("Tuesday",
    //                     style: Theme.of(context).textTheme.bodyText1),
    //                 Checkbox(
    //                     value: daysAvailable['Tuesday'],
    //                     onChanged: (value) {
    //                       setState(() {
    //                         daysAvailable['Tuesday'] =
    //                             daysAvailable['Tuesday'] ? false : true;
    //                       });
    //                     }),
    //                 Text("Wednesday",
    //                     style: Theme.of(context).textTheme.bodyText1),
    //                 Checkbox(
    //                     value: daysAvailable['Wednesday'],
    //                     onChanged: (value) {
    //                       setState(() {
    //                         daysAvailable['Wednesday'] =
    //                             daysAvailable['Wednesday'] ? false : true;
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
    //                       daysAvailable['Thursday'] ? false : true;
    //                 });
    //               }),
    //           Text("Friday", style: Theme.of(context).textTheme.bodyText1),
    //           Checkbox(
    //               value: daysAvailable['Friday'],
    //               onChanged: (value) {
    //                 setState(() {
    //                   daysAvailable['Friday'] =
    //                       daysAvailable['Friday'] ? false : true;
    //                 });
    //               }),
    //           Text("Saturday", style: Theme.of(context).textTheme.bodyText1),
    //           Checkbox(
    //               value: daysAvailable['Saturday'],
    //               onChanged: (value) {
    //                 setState(() {
    //                   daysAvailable['Saturday'] =
    //                       daysAvailable['Saturday'] ? false : true;
    //                 });
    //               }),
    //           Text("Sunday", style: Theme.of(context).textTheme.bodyText1),
    //           Checkbox(
    //               value: daysAvailable['Sunday'],
    //               onChanged: (value) {
    //                 setState(() {
    //                   daysAvailable['Sunday'] =
    //                       daysAvailable['Sunday'] ? false : true;
    //                 });
    //               }),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
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
