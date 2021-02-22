import 'package:edu_connect/models/user.dart';
import 'package:edu_connect/screens/home_screen.dart';
import 'package:edu_connect/screens/search_result/profileView.dart';
import 'package:edu_connect/screens/sign_up_screen.dart';
import 'package:edu_connect/screens/sign_up_user/tutor_signup.dart';
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
import 'models/tutor.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login = prefs.getBool("login");
  print("login:" + login.toString());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.amberAccent,
  //   statusBarBrightness: Brightness.dark,
  // ));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserCurrent>(create: (context) => UserCurrent()),
        ChangeNotifierProvider<Tutor>(create: (context) => Tutor()),
      ],
      child: MyApp(login),


    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp([bool this.login]);

  bool login;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: (login == true) ? '/' : '/welcome',
      routes: {
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUp(),
        // '/tutorsignup': (context) => TutorSignUp(),
        //  '/profileview': (context) => ProfileView(),
      },
    );
  }
}
