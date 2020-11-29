import 'package:edu_connect/models/users.dart';
import 'package:edu_connect/screens/home_screen.dart';
import 'package:edu_connect/screens/sign_up_screen.dart';
import 'package:edu_connect/screens/welcome_screen.dart';
import 'screens/welcome_user/welcome2.dart';
import 'screens/welcome_user/welcome3.dart';
import 'package:edu_connect/screens/welcome_user/welcome1.dart';
import 'package:edu_connect/theme/style.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login = prefs.getBool("login");
  print("login:" + login.toString());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserCurrent()),
      ],
      child: MyApp(login),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool login;
  MyApp(bool this.login);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: (login == true) ? '/' : '/welcome',
      routes: {
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
