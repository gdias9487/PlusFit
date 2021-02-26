import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/src/profilePage/view.dart';
import 'package:plusfit/widgets/animations.dart';

import '../../storage.dart';

var _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final TextEditingController changepass = TextEditingController();
final TextEditingController nomeController = TextEditingController();
final TextEditingController pesoController = TextEditingController();
final TextEditingController alturaController = TextEditingController();

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
  var user = PFUser(email, nome, peso, altura);
  _firestore.collection("usuarios").doc(email).update(user.toMap());
  pesoController.clear();
  nomeController.clear();
  alturaController.clear();
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    // ignore: await_only_futures

    return FutureBuilder(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot snapshot) {
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

class ShowUserInfo extends StatefulWidget {
  final String documentId;

  const ShowUserInfo({Key key, this.documentId}) : super(key: key);
  @override
  _ShowUserInfoState createState() => _ShowUserInfoState();
}

class _ShowUserInfoState extends State<ShowUserInfo> {
  var editname = Icon(
    Icons.edit,
    color: porange,
    size: 20,
  );

  var editheight = Icon(
    Icons.edit,
    color: porange,
    size: 20,
  );
  var editweight = Icon(
    Icons.edit,
    color: porange,
    size: 20,
  );

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    // ignore: await_only_futures

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("",
              style: defaultFont(25, FontWeight.bold, Colors.white));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return Container(
            height: 165,
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  trailing: editname,
                  children: <Widget>[
                    Container(
                        child: TextFormField(
                      controller: nomeController,
                      //keyboardType: TextInputType.visiblePassword,
                      //obscureText: _obscureText,
                      style: defaultFont(16, FontWeight.normal, pgreytextfield),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                setInfo(
                                    _firebaseAuth.currentUser.email,
                                    nomeController.text,
                                    data["peso"].toString(),
                                    data["altura"].toString());
                              });
                            },
                            icon: Icon(Icons.save),
                          ),
                          labelText: 'Nome',
                          labelStyle: defaultFont(
                              16, FontWeight.normal, pgreytextfield)),
                    )),
                  ],
                  title: Text(
                    " Nome: " + data["nome"].toString(),
                    style: defaultFont(16, FontWeight.bold, porange),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: porange,
                        ),
                        Text(
                          " Email: ",
                          key: UniqueKey(),
                          style: defaultFont(16, FontWeight.bold, porange),
                        ),
                        Text(data["email"].toString(),
                            key: UniqueKey(),
                            style:
                                defaultFont(16, FontWeight.bold, Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Text("", style: defaultFont(25, FontWeight.bold, Colors.black));
      },
    );
  }
}
