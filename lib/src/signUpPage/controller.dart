import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:plusfit/authentication.dart';

<<<<<<< HEAD

class Controller extends ControllerMVC{
  String message = 'Caso base';

  AuthenticationService _auth = AuthenticationService();

  Future singUp(email, password, check) async {
    if (password == check) {
      _auth.singUp(email: email, password: password).toString();
      return message;
    } else {
      message = "Senhas não Coencidem";
      return message;
    }
    
=======
class Controller extends ControllerMVC {
  String message;

  AuthenticationService _auth = AuthenticationService();

  Future singIn(email, password) async {
    message = _auth.signUp(email: email, password: password).toString();
>>>>>>> a2022aa04a764d61725d0c5876ca5ac161c58561
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
