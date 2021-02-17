import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/storage.dart';

class ExercisesSuperior extends StatefulWidget {
  ExercisesSuperior(
      {Key key, this.title, @required this.documentId, this.image})
      : super(key: key);

  final String title;
  final String documentId;
  final String image;

  @override
  _ExercisesSuperiorState createState() =>
      _ExercisesSuperiorState(documentId, image);
}

class _ExercisesSuperiorState extends State<ExercisesSuperior> {
  final String documentId;
  final String image;

  var tween = Tween(begin: 100, end: 200);

  _ExercisesSuperiorState(this.documentId, this.image);

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
        Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child: FutureBuilder(
                future: FireStorageService.getImage(
                    context, "images/superior/$image"),
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
        // Container(
        //   height: 50,
        //   width: 150,
        //   decoration: BoxDecoration(
        //       color: Colors.orange[700],
        //       borderRadius: BorderRadius.circular(20)),
        //   child: FlatButton(
        //     child: Text(
        //       'Iniciar Treino',
        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
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
