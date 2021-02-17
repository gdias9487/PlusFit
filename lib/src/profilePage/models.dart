import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/animations.dart';

import '../../storage.dart';

var _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebase = FirebaseAuth.instance;
final TextEditingController changepass = TextEditingController();
final TextEditingController nome = TextEditingController();
final TextEditingController peso = TextEditingController();
final TextEditingController altura = TextEditingController();

showInfo() {
  return editInfo;
}

List editInfo = <Widget>[
  Container(
      child: Column(children: <Widget>[
    TextFormField(
      controller: nome,
      keyboardType: TextInputType.name,
      obscureText: false,
      style: defaultFont(14, FontWeight.normal, pgreytextfield),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: Icon(Icons.account_circle_sharp),
          labelText: 'Nome',
          labelStyle: defaultFont(16, FontWeight.normal, pgreytextfield)),
    ),
    SizedBox(
      height: 10,
    ),
    Row(children: <Widget>[
      Flexible(
          child: TextFormField(
        controller: peso,
        keyboardType: TextInputType.number,
        obscureText: false,
        style: defaultFont(14, FontWeight.normal, pgreytextfield),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            prefixIcon: Icon(Icons.account_circle_sharp),
            labelText: 'Peso',
            labelStyle: defaultFont(16, FontWeight.normal, pgreytextfield)),
      )),
      SizedBox(
        width: 5,
      ),
      Flexible(
          child: TextFormField(
        controller: altura,
        keyboardType: TextInputType.number,
        obscureText: false,
        style: defaultFont(14, FontWeight.normal, pgreytextfield),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            prefixIcon: Icon(Icons.account_circle_sharp),
            labelText: 'Altura',
            labelStyle: defaultFont(16, FontWeight.normal, pgreytextfield)),
      ))
    ]),
    SizedBox(
      height: 10,
    ),
    TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size(100, 35),
            backgroundColor: porange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        onPressed: () {
          setInfo(_firebase.currentUser.email, nome, peso, altura);
        },
        child: Text(
          "Salvar",
          style: defaultFont(14, FontWeight.bold, Colors.white),
        ))
  ])),
];
List editPass = <Widget>[
  Container(
      child: Column(children: <Widget>[
    TextFormField(
      controller: changepass,
      keyboardType: TextInputType.name,
      obscureText: false,
      style: defaultFont(14, FontWeight.normal, pgreytextfield),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: Icon(Icons.account_circle_sharp),
          labelText: 'Email',
          labelStyle: defaultFont(16, FontWeight.normal, pgreytextfield)),
    ),
    TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size(100, 35),
            backgroundColor: porange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        onPressed: () {
          setInfo(_firebase.currentUser.email, nome, peso, altura);
        },
        child: Text(
          "Alterar",
          style: defaultFont(14, FontWeight.bold, Colors.white),
        ))
  ]))
];

class PFUser {
  String email;
  String name;
  String weight;
  String height;
  PFUser(this.email, this.name, this.weight, this.height);

  Map<String, dynamic> toMap() {
    return {"email": email, "nome": name, "peso": weight, "altura": height};
  }
}

setInfo(email, nome, peso, altura) {
  var user = PFUser(email, nome.text, peso.text, altura.text);
  _firestore.collection("usuarios").doc(email).update(user.toMap());
  peso.clear();
  nome.clear();
  altura.clear();
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    // ignore: await_only_futures

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("",
              style: defaultFont(25, FontWeight.bold, Colors.white));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return Text(
            data["nome"].toString(),
            style: defaultFont(25, FontWeight.bold, Colors.white),
          );
        }

        return Text("", style: defaultFont(25, FontWeight.bold, Colors.white));
      },
    );
  }
}

class GetUserEmail extends StatelessWidget {
  final String documentId;

  GetUserEmail(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("",
              style: defaultFont(16, FontWeight.bold, Colors.white));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return Text(
            data["email"].toString(),
            style: defaultFont(16, FontWeight.bold, Colors.white),
          );
        }

        return Text("", style: defaultFont(16, FontWeight.bold, Colors.white));
      },
    );
  }
}

class GetUserImage extends StatelessWidget {
  final String documentId;

  GetUserImage(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("",
              style: defaultFont(16, FontWeight.bold, Colors.white));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          var image = data["image"].toString();
          return FutureBuilder(
            future:
                FireStorageService.getImage(context, "profilephotos/$image"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return CircleAvatar(
                  radius: 82,
                  backgroundColor: Colors.white,
                  child: FadeAnimation(
                      0.8,
                      1,
                      30,
                      0.0,
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: snapshot.data.image,
                      )),
                );
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 80,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ));

              return CircleAvatar();
            },
          );
        }

        return Text("", style: defaultFont(16, FontWeight.bold, Colors.white));
      },
    );
  }
}
