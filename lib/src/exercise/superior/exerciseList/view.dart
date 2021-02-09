import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

var fodase = [];
int x = 0;

class Exercises extends StatefulWidget {
  Exercises({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  String teste;
  var list = ["1", "2", "3"];
  int x = 0;
  _retornaNome(Map map) {
    map.forEach((k, v) {
      if (v.runtimeType.toString() ==
          "_InternalLinkedHashMap<String, dynamic>") {
        _retornaNome(v);
      } else {
        if (k == "nome" && v != null) {
          x++;
          teste += " " + v + ".";
          return teste;
        }
        ;
      }
    });
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      teste = '';
      x = 0;
      _retornaNome(document['exercicios']);
      fodase = teste.split('.');
      return ExerciseContainer(
          width: 1,
          height: 150,
          top: 20,
          left: 20,
          right: 20,
          bottom: 0.0,
          text: teste);
    }).toList();
  }

  batatafrita(fodase) {
    for (var i = 0; i < fodase.length; i++) {
      cebola(fodase[i]);
    }
  }

  cebola(list) {
    return ExerciseContainer(
        width: 1,
        height: 150,
        top: 20,
        left: 20,
        right: 20,
        bottom: 0.0,
        text: teste);
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
                print(fodase[0]);
                return ListView(children: <Widget>[batatafrita(fodase)]);
            }
          }),
    ));
  }
}
