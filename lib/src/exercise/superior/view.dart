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
  _conection() {
    if (dropdownValue != "Todos" && dropdownValue2 != "Todas") {
      return FirebaseFirestore.instance
          .collection('treinos')
          .where('Nivel', isEqualTo: "$dropdownValue")
          .where('tempo', isEqualTo: "$dropdownValue2")
          .where('Tipo', isEqualTo: 'superior')
          .snapshots();
    } else if (dropdownValue == "Todos" && dropdownValue2 != "Todas") {
      return FirebaseFirestore.instance
          .collection('treinos')
          .where('tempo', isEqualTo: "$dropdownValue2")
          .where('Tipo', isEqualTo: 'superior')
          .snapshots();
    } else if (dropdownValue != "Todos" && dropdownValue2 == "Todas") {
      return FirebaseFirestore.instance
          .collection('treinos')
          .where('Nivel', isEqualTo: "$dropdownValue")
          .where('Tipo', isEqualTo: 'superior')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('treinos')
          .where('Tipo', isEqualTo: 'superior')
          .snapshots();
    }
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['Nome'];
      var nivel = document['Nivel'];
      var image = document['image'];
      var tempo = document['tempo'];
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
          subtext: "Nivel: $nivel\nDuração: $tempo minutos",
          action: () {
            Navigator.push(
                context,
                transitionAnimation(
                    ExercisesSuperior(
                      documentId: (document['doc'].toString()),
                      image: (image.toString()),
                      nome: nome,
                    ),
                    1.0,
                    0.0));
          });
    }).toList();
  }

  @override
  String dropdownValue = 'Todos';
  String dropdownValue2 = 'Todas';
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
            Align(
              alignment: Alignment(0.8, 0),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Nivel: ",
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Container(
                    child: DropdownButton(
                      value: dropdownValue,
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.amber),
                      // underline: Container(
                      //  height: 2,
                      //  color: Colors.amber,
                      //),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Todos',
                        'básico',
                        'intermediário',
                        'avançado'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: defaultFont(16, FontWeight.bold, porange),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Duração: ',
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    value: dropdownValue2,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.amber),
                    // underline: Container(
                    //  height: 2,
                    //  color: Colors.amber,s
                    //),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
                    },
                    items: <String>[
                      'Todas',
                      '15',
                      '20',
                      '25',
                      '30',
                      '35',
                      '40',
                      '45',
                      '50'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: defaultFont(16, FontWeight.bold, porange),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: StreamBuilder(
                  stream: _conection(),
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
