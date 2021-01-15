import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Key key;
  final double fontSize;
  final double width;
  final double height;
  final double radius;
  final String text;
  final color;
  final action;

  const DefaultElevatedButton(
      {this.key,
      @required this.color,
      @required this.fontSize,
      @required this.height,
      @required this.radius,
      @required this.width,
      this.action,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          minimumSize: Size(height, width),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      onPressed: () { action; },
      child: Text(text),
    );
  }
}

class DefaultOutlinedButton extends StatelessWidget {
  final Key key;
  final double fontSize;
  final double width;
  final double height;
  final double radius;
  final String route;
  final String text;
  final color;

  const DefaultOutlinedButton(
      {this.key,
      @required this.color,
      @required this.fontSize,
      @required this.height,
      @required this.radius,
      @required this.width,
      @required this.route,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: color,
            side: BorderSide(color: color),
            textStyle:
                TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            minimumSize: Size(height, width),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(text));
  }
}
