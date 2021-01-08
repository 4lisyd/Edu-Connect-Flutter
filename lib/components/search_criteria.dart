import 'package:edu_connect/components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCriteria extends StatefulWidget {
  @override
  _SearchCriteriaState createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          width: MediaQuery.of(context).size.width,
        ),
        actions: [
          FlatButton(
              onPressed: () {
                print('"seached..');
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor),
                child: Center(
                  child: Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 18),
                  ),
                ),
              ))
        ],
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
