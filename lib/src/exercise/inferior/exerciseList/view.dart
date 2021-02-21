import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

import '../../../../storage.dart';

class ExercisesInferior extends StatefulWidget {
  ExercisesInferior({Key key, this.title, this.documentId, this.image})
      : super(key: key);

  final String title;
  final String documentId;
  final String image;

  @override
  _ExercisesInferiorPageState createState() =>
      _ExercisesInferiorPageState(documentId, image);
}

class _ExercisesInferiorPageState extends State<ExercisesInferior> {
  final String documentId;
  final String image;

  _ExercisesInferiorPageState(this.documentId, this.image);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['nome'];
      var series = document['series'];
      var repeticoes = document['repeticoes'];
      var gif = document['gif'];
      return WorkoutContainer(
        gif: '$gif',
        width: 1,
        height: 100,
        top: 0,
        left: 30,
        right: 30,
        bottom: 20.0,
        text: "$nome",
        subtext: "$series series de $repeticoes repetições",
        image: "assets/signup.jpg",
      );
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sign_up_background.png"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/inferior/$image"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      '$documentId',
                      style: defaultFont(30, FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('treinos/$documentId/exercicios')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    return ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: makeListWidget(snapshot));
                }
              }),
        ),
      ]),
    ));
  }
}
