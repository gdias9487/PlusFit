import 'package:flutter/material.dart';
import 'package:plusfit/loginpage.dart';
import 'package:plusfit/components/constants.dart';

void main() {
  runApp(PFApp());
}

class PFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlusFit v1.0',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage(title: 'PlusFit'),
      debugShowCheckedModeBanner: false,
    );
  }
}
