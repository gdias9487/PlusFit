import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class Exercises extends StatefulWidget {
  Exercises({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    int x = 0;
    return snapshot.data.docs.map<Widget>((document) {
      x++;
      return ExerciseContainer(
        width: 1,
        height: 100,
        top: 20,
        left: 20,
        right: 20,
        bottom: 0.0,
        text: document['exercicios.exercicio$x' + '.nome'].toString(),
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
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('treinos')
              // .doc('Biceps')
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView(children: makeListWidget(snapshot));
            }
          }),
    ));
  }
}
