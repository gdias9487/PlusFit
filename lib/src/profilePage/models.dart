import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/profilePage/view.dart';
import 'package:plusfit/widgets/animations.dart';

import '../../storage.dart';

var _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebase = FirebaseAuth.instance;
final TextEditingController changepass = TextEditingController();
final TextEditingController nome = TextEditingController();
final TextEditingController peso = TextEditingController();
final TextEditingController altura = TextEditingController();

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
            key: UniqueKey(),
            style: defaultFont(25, FontWeight.bold, Colors.white),
          );
        }

        return Text("", style: defaultFont(25, FontWeight.bold, Colors.white));
      },
    );
  }
}
