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
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sign_up_background.png"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child: FutureBuilder(
                future: FireStorageService.getImage(
                    context, "images/inferior/$image"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return Container(
                      color: Colors.transparent,
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1,
                      child: snapshot.data,
                    );
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Container(
                        height: MediaQuery.of(context).size.height / 1.25,
                        width: MediaQuery.of(context).size.width / 1.25,
                        child: CircularProgressIndicator());

                  return Container();
                },
              ),
            ),
          ),
          Positioned(
            top: 65,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: 0,
            top: 200,
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                '$documentId',
                style: defaultFont(30, FontWeight.bold, Colors.white),
              ),
            ),
          ),
        ]),
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
