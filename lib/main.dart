import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/pages/loginpage.dart';
import 'package:plusfit/pages/homePage.dart';
import 'package:plusfit/pages/profilePage.dart';
import 'package:plusfit/pages/resetpasswordPage.dart';
import 'package:plusfit/pages/aboutPage.dart';
import 'package:plusfit/pages/exercisesPage.dart';
import 'package:plusfit/pages/signupPage.dart';
import 'package:plusfit/pages/signupPage2.dart';

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
        '/signup2': (context) => SignupprfPage(),
        '/perfil': (context) => PerfilPage()
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
