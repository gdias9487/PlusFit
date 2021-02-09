import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Inferior extends StatefulWidget {
  Inferior({Key key, this.title, this.nivel}) : super(key: key);

  final String title;
  final String nivel;

  @override
  _InferiorPageState createState() => _InferiorPageState(nivel);
}

class _InferiorPageState extends State<Inferior> {
  final String nivel;

  _InferiorPageState(this.nivel);
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ListTile(
        title: Text(document['Nome']),
        subtitle: Text(document['Nivel']),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Treinos',
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
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('exercicios')
                .where('Nivel', isEqualTo: nivel)
                .where('Tipo', isEqualTo: 'inferior')
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
    );
  }
}
