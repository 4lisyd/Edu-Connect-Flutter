import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google login"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Theme.of(context).backgroundColor,
        //       Theme.of(context).accentColor,
        //     ],
        //     begin: const FractionalOffset(0.0, 0.0),
        //     end: const FractionalOffset(6.0, 6.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.mirror,
        //   ),
        // ),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text("Enter username",style: Theme.of(context).textTheme.bodyText1,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: Icon(Icons.face_sharp),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Text("Enter Password",style: Theme.of(context).textTheme.bodyText1,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: Icon(Icons.account_box),
                  ),
                ),
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  FlatButton(
                    textColor: Theme.of(context).accentColor,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
