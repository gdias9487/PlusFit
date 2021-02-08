import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/components/constants.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  AnimationController _controler;

  bool _profileContainerOpenned = false;

  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            color: Colors.white,
            splashRadius: 20,
            iconSize: 35,
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sign_up_background.png"),
                  fit: BoxFit.cover)),
          child: Container(
            child: ListView(controller: cont, children: <Widget>[
              SizedBox(
                height: paddefault,
              ),
              SizedBox(
                height: 15,
              ),
              TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Superiores',
                action: () {
                  Navigator.pushNamed(context, '/superior');
                },
              ),
              TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Inferiores',
                action: () {
                  Navigator.pushNamed(context, '/inferior');
                },
              ),
              TrainingContainer(
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Cardiovascular',
                action: () {
                  Navigator.pushNamed(context, '/cardio');
                },
              ),
            ]),
          )),
    );
  }
}
