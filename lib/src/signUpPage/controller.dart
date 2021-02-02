import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:plusfit/authentication.dart';


class Controller extends ControllerMVC{
  String message;

  AuthenticationService _auth = AuthenticationService();

  Future singIn(email, password) async {

    message = _auth.singUp(email: email, password: password).toString();

  }

   toggle(value) {
      value = !value;
      if (value) {
        return Icons.visibility_off;
      } else {
        return Icons.visibility;
    }
  }
  




}