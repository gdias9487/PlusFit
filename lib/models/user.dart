import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String height;
  final String weight;
  final String age;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.height,
    @required this.weight,
    @required this.age,
  });
}
