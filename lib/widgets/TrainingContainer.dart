import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusfit/components/constants.dart';

class TrainingContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double horizontal;
  final double vertical;
  final String text;
  final action;

  const TrainingContainer(
      {this.key,
      this.action,
      @required this.height,
      @required this.horizontal,
      @required this.vertical,
      @required this.text,
      @required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.5)),
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: defaultFont(20, FontWeight.bold, Colors.white),
                )
              ],
            )),
      ),
    );
  }
}

class ExerciseContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double right;
  final double left;
  final double top;
  final double bottom;
  final String text;
  final String subtext;
  final color;
  final action;

  const ExerciseContainer(
      {this.key,
      this.color = Colors.white70,
      this.action,
      @required this.height,
      @required this.right,
      @required this.top,
      @required this.text,
      @required this.width,
      this.left,
      this.bottom,
      this.subtext = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding:
            EdgeInsets.only(right: right, left: left, top: top, bottom: bottom),
        child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5)),
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(text,
                    textAlign: TextAlign.center,
                    style: defaultFont(18, FontWeight.bold, Colors.amber)),
                Text(subtext,
                    textAlign: TextAlign.center,
                    style: defaultFont(16, FontWeight.normal, Colors.amber)),
              ],
            )),
      ),
    );
  }
}

dificult(nivel) {
  if (nivel == "básico") {
    return Colors.yellow[400];
  } else if (nivel == "intermediário") {
    return Colors.orange[500];
  } else {
    return Colors.red[500];
  }
}
