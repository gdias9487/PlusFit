import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/src/exercise/cardiovascular/view.dart';
import 'package:plusfit/src/exercise/inferior/view.dart';
import 'package:plusfit/src/exercise/superior/view.dart';
import 'package:plusfit/src/profilePage/view.dart';

import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/animations.dart';

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
        title: FadeAnimation(
            2,
            500,
            -40.0,
            0.0,
            Center(
                child: Text(
              "Categorias",
              style: defaultFont(23, FontWeight.bold, Colors.white),
            ))),
        actions: [
          FadeAnimation(
              2,
              500,
              -40.0,
              0.0,
              IconButton(
                icon: Icon(Icons.account_circle_sharp),
                color: Colors.white,
                splashRadius: 20,
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                      context, transitionAnimation(PerfilPage(), 1.0, 0.0));
                },
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 0,
          splashRadius: 20,
          color: Colors.black,
          highlightColor: Colors.black,
          splashColor: Colors.black,
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sign_up_background.png"),
                fit: BoxFit.cover)),
        child: ListView(controller: cont, children: <Widget>[
          SizedBox(
            height: paddefault,
          ),
          SizedBox(
            height: 15,
          ),
          FadeAnimation(
              2,
              500,
              30.0,
              0.0,
              TrainingContainer(
                image: "assets/superiores.jpeg",
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Superiores',
                action: () {
                  Navigator.push(
                      context, transitionAnimation(SuperiorPage(), 1.0, 0.0));
                },
              )),
          FadeAnimation(
              2,
              500,
              30.0,
              0.0,
              TrainingContainer(
                image: "assets/inferior.jpg",
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Inferiores',
                action: () {
                  Navigator.push(
                      context, transitionAnimation(InferiorPage(), 1.0, 0.0));
                },
              )),
          FadeAnimation(
              2,
              500,
              30.0,
              0.0,
              TrainingContainer(
                image: "assets/cardio.png",
                width: 1,
                height: 150,
                horizontal: 15,
                vertical: 10,
                text: 'Cardiovascular',
                action: () {
                  Navigator.push(context,
                      transitionAnimation(CardiovascularPage(), 1.0, 0.0));
                },
              )),
        ]),
      ),
    );
  }
}
