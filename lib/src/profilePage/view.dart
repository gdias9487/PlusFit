import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/src/profilePage/models.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../components/constants.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  PickedFile _imagefile;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    logoff(firebaseUser) {
      _firebaseAuth.signOut();
      print(_firebaseAuth.currentUser);
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', (Route<dynamic> route) => false);
    }

    final firebaseUser = context.watch<User>();
    void _showDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert_Box(
              buttons: <Widget>[
                TextButton(
                    onPressed: () {
                      logoff(firebaseUser);
                    },
                    child: Text("Sim",
                        style: defaultFont(14, FontWeight.bold, porange))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Não",
                        style: defaultFont(14, FontWeight.bold, porange))),
              ],
              title: "Desconectar",
              text: "Você deseja sair da sua conta?",
            );
          });
    }

    return Drawer(
        child: Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                  0,
                  500,
                  -40.0,
                  0.0,
                  Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: perfilImagem(),
                    ),
                  )),
              SizedBox(height: 10),
              Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    GetUserName(getEmail(_firebaseAuth.currentUser)),
                    SizedBox(
                      height: 10,
                    ),
                  ])),
              SizedBox(height: 20.0),
              FadeAnimation(
                  0,
                  500,
                  30.0,
                  0.0,
                  Text(
                    "Conta",
                    style: defaultFont(20, FontWeight.bold, Colors.white),
                  )),
              SizedBox(height: 10.0),
              FadeAnimation(
                  0,
                  500,
                  30.0,
                  0.0,
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            onExpansionChanged: (value) {
                              Icon(Icons.arrow_drop_down);
                            },
                            children: showInfo(),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16,
                            ),
                            leading: Icon(Icons.person, color: Colors.black),
                            title: Text(
                              "Informações pessoais",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            ),
                          ),
                          Divider(height: 10.0, color: Colors.grey),
                          ExpansionTile(
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16,
                            ),
                            leading: Icon(Icons.vpn_key, color: Colors.black),
                            title: Text(
                              "Alterar senha",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            ),
                            children: editPass,
                          ),
                          Divider(height: 10.0, color: Colors.grey),
                          ListTile(
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16,
                            ),
                            leading: Icon(Icons.assignment_turned_in_sharp,
                                color: Colors.black),
                            title: Text(
                              "Treinos",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            ),
                            onTap: () {},
                          ),
                          Divider(height: 10.0, color: Colors.grey),
                          ListTile(
                            leading: Icon(Icons.close, color: Colors.black),
                            title: Text(
                              "Desconectar",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            ),
                            onTap: () {
                              _showDialog();
                            },
                          ),
                          Divider(height: 10.0, color: Colors.grey),
                          ListTile(
                            leading: Icon(Icons.block_outlined, color: porange),
                            title: Text(
                              "Desativar conta",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.red),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 10.0),
              FadeAnimation(
                  0,
                  500,
                  30.0,
                  0.0,
                  Text(
                    "Configurações",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              SizedBox(height: 10.0),
              FadeAnimation(
                  0,
                  500,
                  30.0,
                  0.0,
                  Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              onTap: () {
                                Switch(
                                  value: true,
                                  onChanged: (bool value) {},
                                );
                              },
                              leading: Icon(Icons.notifications,
                                  color: Colors.black),
                              title: Text(
                                "Notificações",
                                style: defaultFont(
                                    16, FontWeight.normal, Colors.black),
                              )),
                          Divider(height: 10.0, color: Colors.grey),
                          ListTile(
                            leading:
                                Icon(Icons.headset_mic, color: Colors.black),
                            title: Text(
                              "Suporte",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    ));
  }

  imageChecker() {
    if (_imagefile == null) {
      return AssetImage("assets/homem.png");
    } else {
      return FileImage(File(_imagefile.path));
    }
  }

  Widget perfilImagem() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 90,
          backgroundImage: imageChecker(),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bordaEdit()),
              );
            },
            child: Icon(
              Icons.edit,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget bordaEdit() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Escolha uma opção",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takedPhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takedPhoto(ImageSource.gallery);
                },
                label: Text("Galeria"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takedPhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imagefile = pickedFile;
    });
  }
}
