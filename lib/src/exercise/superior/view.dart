import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/exercise/superior/exerciseList/view.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'package:plusfit/widgets/animations.dart';

class SuperiorPage extends StatefulWidget {
  SuperiorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SuperiorPageState createState() => _SuperiorPageState();
}

class _SuperiorPageState extends State<SuperiorPage> {
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['Nome'];
      var nivel = document['Nivel'];
      var image = document['image'];
      var doc = document['doc'];
      print(doc);
      return ExerciseContainer(
          color: dificult(nivel),
          width: 1,
          height: 100,
          top: 20,
          left: 20,
          right: 20,
          bottom: 0.0,
          image: "assets/superior/$image",
          text: "$nome",
          subtext: "Nivel: $nivel",
          action: () {
            Navigator.push(
                context,
                transitionAnimation(
                    ExercisesSuperior(
                      documentId: (document['doc'].toString()),
                      image: (document['image'].toString()),
                      nome: document['Nome'],
                    ),
                    1.0,
                    0.0));
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Treinos Superiores',
          style: defaultFont(18, FontWeight.bold, Colors.white),
        ),
        actions: [],
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
                image: AssetImage("assets/back_treinos.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Image.asset('assets/superiores.png'),
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('treinos')
                      // .where('Nivel', isEqualTo: nivel)
                      .where('Tipo', isEqualTo: 'superior')
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
            )
          ],
        ),
      ),
    );
  }
}
