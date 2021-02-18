import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:quiver/async.dart';

class Alert_Box extends StatelessWidget {
  final Key key;
  final buttons;
  final text;
  final title;
  final action;

  const Alert_Box(
      {this.buttons,
      this.text,
      this.title = " Ocorreu um erro ",
      this.key,
      this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: new Text(text),
        actions: buttons,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))));
  }
}

int _start = 10;
int _current = 10;

class Analise extends StatefulWidget {
  @override
  _AnaliseState createState() => _AnaliseState();
}

class _AnaliseState extends State<Analise> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }
}

class ExerciseInfo extends StatelessWidget {
  final String tag;
  @override
  ExerciseInfo({this.tag});
  Widget build(BuildContext context) {
    return Hero(
      flightShuttleBuilder: (context, anim, direction, fromContext, toContext) {
        final Hero toHero = toContext.widget;
        if (direction == HeroFlightDirection.pop) {
          return FadeTransition(
            opacity: AlwaysStoppedAnimation(0),
            child: toHero.child,
          );
        } else {
          return toHero.child;
        }
      },
      tag: tag,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.deepOrange[900],
                      ],
                      begin: Alignment(-1.0, -2.0),
                      end: Alignment(1.0, 2.0),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                height: 300,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                )),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  //color: Colors.red[900],
                  image: DecorationImage(
                      image: AssetImage("assets/superior/gifs/flexao.gif"),
                      fit: BoxFit.fitWidth)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 10),
              child: FlatButton(
                  minWidth: 10,
                  splashColor: Colors.grey[600],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
            ),
          ],
        ),
      ),
    );
  }
}
