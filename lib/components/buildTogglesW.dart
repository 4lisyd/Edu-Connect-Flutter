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
  }
}

class buildTogglesW_ViewOnly extends StatelessWidget {
  @override
  Map<String, bool> daysAvailable;

  buildTogglesW_ViewOnly(this.daysAvailable);

  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          for (var item in daysAvailable.entries)
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.key, style: Theme.of(context).textTheme.bodyText2),
                  Checkbox(
                    value: item.value,
                    onChanged: (bool value) {},
                  ),
                ],
              ),
            ),
        ],
        alignment: WrapAlignment.center,
      ),
    );
  }
}
