import 'package:edu_connect/screens/sign_up_screen.dart';
import 'package:edu_connect/screens/welcome_screen.dart';
import 'package:edu_connect/theme/style.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: SignUp(),
    );
  }
}
