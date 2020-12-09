import 'package:edu_connect/components/buttons.dart';
import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/sign_up_user/email_log.dart';
import 'package:edu_connect/screens/sign_up_user/phone_log.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose sign up method"),
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "How would you like to sign up?",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Custombutton1(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignUp()),
                  );
                }, 'Sign in using Google'),
                SizedBox(
                  height: 10,
                ),
                Custombutton1(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneSignUp()),
                  );
                }, "Sign in using Phone"),
                // Text(
                //   'sd   s',
                //   style: Theme.of(context).textTheme.bodyText1,
                // ),
                // Consumer<UserCurrent>(
                //     builder: (context, user, child) => Text(
                //           user.name,
                //           style: Theme.of(context).textTheme.bodyText1,
                //         )),

                // FlatButton(
                //     onPressed: () {
                //       // User user = User();
                //       print(currentUser.loggedin);
                //       currentUser.setUser("shhsdjjf", "d", "phoneNo", true);
                //       print(currentUser.phoneNo);
                //       context.read<UserCurrent>().setName('hh');
                //     },
                //     child: Container(
                //       color: Colors.blue,
                //       child: Text('okasdasd'),
                //     ))

                //RaisedButton(onPressed: (){}, child: Text("Sign in using Google")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
