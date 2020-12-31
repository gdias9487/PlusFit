import 'package:flutter/material.dart';
import 'package:plusfit/loginpage.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/homepage.dart';
import 'package:plusfit/mainpage.dart';
import 'package:plusfit/reset_password.dart';
import 'package:plusfit/about.dart';
import 'package:plusfit/exercises.dart';
import 'package:plusfit/signuppage.dart';
import 'package:plusfit/signuppageprf.dart';

void main() {
  runApp(PFApp());
}

class PFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/reset': (context) => ResetPassword(),
        '/about': (context) => AboutPage(),
        '/exercises': (context) => ExercisePage(),
        '/signupprf': (context) => SignupprfPage(),
        '/reset': (context) => ResetPassword(),
        '/main': (context) => MainPage()
      },
      title: 'PlusFit v1.0',
      theme: ThemeData(
        primaryColor: porange,
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(title: 'PlusFit'),
      debugShowCheckedModeBanner: false,
    );
  }
}
