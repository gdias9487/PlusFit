import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class ExercisesSuperior extends StatefulWidget {
  ExercisesSuperior({Key key, this.title, @required this.documentId}) : super(key: key);

  final String title;
  final String documentId;

  @override
  _ExercisesSuperiorState createState() => _ExercisesSuperiorState(documentId);
}

class _ExercisesSuperiorState extends State<ExercisesSuperior> {
  final String documentId;

  _ExercisesSuperiorState(this.documentId);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) { 
      var nome = document['nome'];
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
        left: 30,
        right: 30,
        bottom: 0.0,
        text: "$nome",
      );
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Exercicios',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                return ListView(children: makeListWidget(snapshot));
            }
          }),
    ));
  }
}
