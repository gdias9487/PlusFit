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
  final String descricao;
  final String gif;
  @override
  ExerciseInfo({this.tag, this.gif, this.descricao});
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
                    border: Border.all(width: 2, color: Colors.yellow),
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                height: 600,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                )),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    //color: Colors.red[900],
                    image: DecorationImage(
                        image: AssetImage("assets/exercicios/$gif"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 10),
              child: FlatButton(
                  minWidth: 10,
                  splashColor: Colors.grey[600],
                  textColor: Colors.yellow,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
            ),
            Padding(
                padding: EdgeInsets.only(top: 350, left: 50),
                child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 20, right: 20, bottom: 15),
                      child: Text(
                        "Descrição:\n $descricao",
                        style:
                            defaultFont(14, FontWeight.normal, Colors.yellow),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
