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

class ShowUserInfo extends StatefulWidget {
  final String documentId;

  const ShowUserInfo({Key key, this.documentId}) : super(key: key);
  @override
  _ShowUserInfoState createState() => _ShowUserInfoState();
}

class _ShowUserInfoState extends State<ShowUserInfo> {
  double showname = 10;
  double showheight = 10;
  double showweight = 10;
  double editname = 10;
  double editheight = 10;
  double editweight = 10;
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
            height: 300,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: showname),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: porange,
                        ),
                        Text(
                          " Nome: ",
                          key: UniqueKey(),
                          style: defaultFont(16, FontWeight.bold, porange),
                        ),
                        Text(data["nome"].toString(),
                            key: UniqueKey(),
                            style:
                                defaultFont(16, FontWeight.bold, Colors.black)),
                        Spacer(),
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 20,
                                ),
                                splashColor: Colors.white,
                                focusColor: Colors.white,
                                disabledColor: Colors.white,
                                hoverColor: Colors.white,
                                highlightColor: Colors.white,
                                color: porange,
                                onPressed: () {})),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: showweight, top: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.line_weight,
                          color: porange,
                        ),
                        Text(
                          " Peso: ",
                          key: UniqueKey(),
                          style: defaultFont(16, FontWeight.bold, porange),
                        ),
                        Text(data["peso"].toString() + "kg",
                            key: UniqueKey(),
                            style:
                                defaultFont(16, FontWeight.bold, Colors.black)),
                        Spacer(),
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 20,
                                ),
                                splashColor: Colors.white,
                                focusColor: Colors.white,
                                disabledColor: Colors.white,
                                hoverColor: Colors.white,
                                highlightColor: Colors.white,
                                color: porange,
                                onPressed: () {
                                  setState(() {
                                    showweight = 1000;
                                  });
                                })),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: showheight, top: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.height,
                          color: porange,
                        ),
                        Text(
                          "Altura: ",
                          key: UniqueKey(),
                          style: defaultFont(16, FontWeight.bold, porange),
                        ),
                        Text(data["altura"].toString() + "cm",
                            key: UniqueKey(),
                            style:
                                defaultFont(16, FontWeight.bold, Colors.black)),
                        Spacer(),
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 20,
                                ),
                                splashColor: Colors.white,
                                focusColor: Colors.white,
                                disabledColor: Colors.white,
                                hoverColor: Colors.white,
                                highlightColor: Colors.white,
                                color: porange,
                                onPressed: () {})),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
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
