import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:plusfit/widgets/AlertDialog.dart';

class ExercisesSuperior extends StatefulWidget {
  ExercisesSuperior(
      {Key key, this.title, this.nome, @required this.documentId, this.image})
      : super(key: key);

  final String title;
  final String documentId;
  final String nome;
  final String image;
  var db = FirebaseFirestore.instance;

  @override
  _ExercisesSuperiorState createState() =>
      _ExercisesSuperiorState(documentId, nome, image);
}

class _ExercisesSuperiorState extends State<ExercisesSuperior> {
  final String documentId;
  final String nome;
  final String image;

  void _showDialog1(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Alert_Box(
            title: "Conclusão de Treinos",
            text: "Treino Concluído com Sucesso!",
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expansion();
  }

  expansion() {}

  _showDialog(context, widget) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeAnimation(0.5, 1, 10.0, 0.0, widget);
        });
  }

  _ExercisesSuperiorState(this.documentId, this.nome, this.image);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['nome'];
      var series = document['series'];
      var repeticoes = document['repeticoes'];
      var gif = document['gif'];
      var descricao = document['descricao'];

      return WorkoutContainer(
          action: () {
            //_showDialog(context, exerciseInfo(context, nome, series, repeticoes));
          },
          gif: '$gif',
          width: 1,
          height: 100,
          top: 0,
          left: 30,
          right: 30,
          bottom: 20,
          text: "$nome",
          descricao: "$descricao",
          subtext: "$series series de $repeticoes repetições",
          image: "assets/signup.jpg");
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
                    image: AssetImage("assets/superior/$image"),
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
                      '$nome',
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
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //color: Colors.white,
            height: 60,
            width: 200,
            child: ElevatedButton(
                child: Center(
                    child: Text("Concluir Treino",
                        style: TextStyle(
                          color: Colors.lightGreenAccent[400],
                        ))),
                style: ElevatedButton.styleFrom(
                  primary: porange,
                  textStyle: defaultFont(20, FontWeight.bold, Colors.green),
                  minimumSize: Size(370, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  var db = FirebaseFirestore.instance;
                  db.collection("treinos").doc("$documentId").update({
                    "concluido": "sim",
                  });
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    ));
  }
}
