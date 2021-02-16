import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class ExercisesCardio extends StatefulWidget {
  final String title;
  final String documentId;

  const ExercisesCardio({Key key, this.title, this.documentId})
      : super(key: key);

  @override
  _ExercisesCardioPageState createState() =>
      _ExercisesCardioPageState(documentId);
}

class _ExercisesCardioPageState extends State<ExercisesCardio> {
  final String documentId;

  _ExercisesCardioPageState(this.documentId);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['nome'];
      return ExerciseContainer(
        width: 1,
        height: 100,
        top: 20,
        left: 30,
        right: 30,
        bottom: 0.0,
        text: "$nome",
        image: "assets/signup.jpg",
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
          child: Column(children: [
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.orange[700],
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                child: Text(
                  'Iniciar Treino',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
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
                        return ListView(children: makeListWidget(snapshot));
                    }
                  }),
            ),
          ]),
        ));
  }
}
