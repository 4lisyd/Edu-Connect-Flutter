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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/welcome1': (context) => Welcome1(),
        '/welcome2': (context) => Welcome2(),
        '/welcome3': (context) => Welcome3(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
