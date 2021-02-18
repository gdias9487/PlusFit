import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/AlertDialog.dart';

class TrainingContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double horizontal;
  final double vertical;
  final String text;
  final String image;
  final action;

  const TrainingContainer(
      {this.key,
      this.action,
      this.image,
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
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment(0, -0.5),
                    colors: [Colors.red[300].withOpacity(0.4), Colors.black]),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topRight,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop)),
                border:
                    Border.all(width: 3, color: Colors.white.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                SizedBox(
                  width: 25,
                ),
                Text(
                  text,
                  style: defaultFont(23, FontWeight.bold, Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 25,
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
  final String image;
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
      this.subtext = '',
      this.image});

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
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment(0, -0.5),
                  colors: [
                    Colors.yellow,
                    Colors.red[300].withOpacity(0.4),
                    Colors.black
                  ]),
              image: DecorationImage(
                  image: (AssetImage(image)),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(text,
                    textAlign: TextAlign.start,
                    style: defaultFont(18, FontWeight.bold, Colors.amber)),
                SizedBox(
                  height: 10,
                ),
                Text(subtext,
                    textAlign: TextAlign.left,
                    style: defaultFont(16, FontWeight.normal, Colors.amber)),
              ],
            )),
      ),
    );
  }
}

class WorkoutContainer extends StatelessWidget {
  final Key key;
  final double width;
  final double height;
  final double right;
  final double left;
  final double top;
  final double bottom;
  final String text;
  final String subtext;
  final String image;
  final color;
  final action;

  const WorkoutContainer(
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
      this.subtext = '',
      this.image});

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
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment(0, -0.5),
                  colors: [
                    Colors.yellow,
                    Colors.red[300].withOpacity(0.4),
                    Colors.black
                  ]),
              image: DecorationImage(
                  image: (AssetImage(image)),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop)),
            ),
            child: Row(
              children: [
                Hero(
                  tag: text,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              transitionDuration: Duration(seconds: 1),
                              pageBuilder: (_, __, ___) =>
                                  ExerciseInfo(tag: text)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 1),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.deepOrange[900],
                          ],
                          begin: Alignment(-1.0, -2.0),
                          end: Alignment(1.0, 2.0),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/superior/gifs/flexao.gif")),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 80,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 15),
                      child: Text(text,
                          textAlign: TextAlign.start,
                          style:
                              defaultFont(15, FontWeight.bold, Colors.amber)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(subtext,
                          textAlign: TextAlign.left,
                          style:
                              defaultFont(14, FontWeight.normal, Colors.amber)),
                    ),
                  ],
                ),
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
