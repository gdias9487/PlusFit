import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:plusfit/authentication.dart';

var confirmp;

class Controller extends ControllerMVC {
  String message;

  AuthenticationService _auth = AuthenticationService();

  Future singIn(email, password) async {
    message = _auth.signUp(email: email, password: password).toString();
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

// ignore: missing_return
String validateemail(value) {
  if (value.isEmpty) {
    return "Campo obrigatório *";
  } else if (!(value.contains('@') && value.contains('.com'))) {
    return "Digite um email válido *";
  } else {
    return null;
  }
}

String pass(value) {
  confirmp = value;
  if (value.isEmpty) {
    return "Este campo não pode estar vazio *";
  } else if (value.toString().length < 7) {
    return "Digite uma senha com pelo menos 8 digitos.";
  }
  return null;
}

String confirmpass(value) {
  if (value.isEmpty) {
    return "Este campo não pode estar vazio. *";
  } else if (value != confirmp) {
    return "As senhas devem ser iguais! *";
  }
  return null;
}
