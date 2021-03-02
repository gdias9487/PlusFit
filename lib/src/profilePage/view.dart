import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/src/profilePage/models.dart';
import 'package:plusfit/src/profilePage/controller.dart';
// import 'package:plusfit/src/resetPasswordPage/controller.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';
import 'dart:io';
import 'dart:convert';
import '../../authentication.dart';
import '../../components/constants.dart';

String downloadUrl;

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  final user = FirebaseAuth.instance.currentUser;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Controller controller = Controller();
  ShowUserInfo _showinfo = ShowUserInfo();
  // ignore: unused_field
  final ImagePicker _picker = ImagePicker();
  File _imageFile;

  final picker = ImagePicker();
  var nome;

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = user.email;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profilephotos/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    taskSnapshot.ref.getDownloadURL().then((String value) {
      if (value != null) {
        downloadUrl = value;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    logoff(firebaseUser) {
      FirebaseAuth.instance.signOut();
      print(user);
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', (Route<dynamic> route) => false);
    }

    final firebaseUser = context.watch<User>();
    void _showDialog(widget) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return FadeAnimation(0, 1000, 1000.0, 0.0, widget);
          });
    }

    _fetchData() {}

    initState() {
      super.initState();
      _fetchData();
    }

    return Drawer(
        child: Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: CircleAvatar(
                            key: UniqueKey(),
                            radius: 82,
                            backgroundColor: Colors.white,
                            child: FadeAnimation(
                                0.8,
                                1,
                                30,
                                0.0,
                                CircleAvatar(
                                  key: UniqueKey(),
                                  radius: 80,
                                  backgroundImage: NetworkImage(user.photoURL),
                                )),
                          ),
                          onTap: () {
                            _showDialog(bordaEdit());
                          },
                        )),
                  ),
                  SizedBox(height: 10),
                  FadeAnimation(
                      0.5,
                      400,
                      -100.0,
                      0.0,
                      Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            GetUserName(user.email),
                            SizedBox(
                              height: 10,
                            ),
                          ]))),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                      0.5,
                      500,
                      100.0,
                      0.0,
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Conta",
                            style:
                                defaultFont(20, FontWeight.bold, Colors.white),
                          ))),
                  SizedBox(height: 10.0),
                  FadeAnimation(
                      0.5,
                      500,
                      100.0,
                      0.0,
                      Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              ExpansionTile(
                                onExpansionChanged: (value) {},
                                children: <Widget>[
                                  ShowUserInfo(documentId: user.email),
                                ],
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text(
                                  "Informações pessoais",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                              ),
                              Divider(height: 10.0, color: Colors.grey),
                              ExpansionTile(
                                leading:
                                    Icon(Icons.vpn_key, color: Colors.black),
                                title: Text(
                                  "Alterar senha",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                                children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[
                                    TextFormField(
                                      controller: changepass,
                                      keyboardType: TextInputType.name,
                                      obscureText: false,
                                      style: defaultFont(14, FontWeight.normal,
                                          pgreytextfield),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon:
                                              Icon(Icons.account_circle_sharp),
                                          labelText: 'Email',
                                          labelStyle: defaultFont(
                                              16,
                                              FontWeight.normal,
                                              pgreytextfield)),
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            minimumSize: Size(100, 35),
                                            backgroundColor: porange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35))),
                                        onPressed: () {
                                          setInfo(user.email, nomeController,
                                              pesoController, alturaController);
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Alterar",
                                          style: defaultFont(14,
                                              FontWeight.bold, Colors.white),
                                        ))
                                  ]))
                                ],
                              ),
                              Divider(height: 10.0, color: Colors.grey),
                              ListTile(
                                leading: Icon(Icons.assignment_turned_in_sharp,
                                    color: Colors.black),
                                title: Text(
                                  "Sugestão de Treinos",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (conxtext) => Treinos()));
                                },
                              ),
                              Divider(height: 10.0, color: Colors.grey),
                              ListTile(
                                leading: Icon(Icons.assignment_turned_in_sharp,
                                    color: Colors.black),
                                title: Text(
                                  "Treinos Concluidos",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (conxtext) => Treinos()));
                                },
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
                                  _showDialog(Alert_Box(
                                    buttons: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            logoff(firebaseUser);
                                          },
                                          child: Text("Sim",
                                              style: defaultFont(14,
                                                  FontWeight.bold, porange))),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Não",
                                              style: defaultFont(14,
                                                  FontWeight.bold, porange))),
                                    ],
                                    title: "Desconectar",
                                    text: "Você deseja sair da sua conta?",
                                  ));
                                },
                              ),
                              Divider(height: 10.0, color: Colors.grey),
                              ListTile(
                                  leading: Icon(Icons.block_outlined,
                                      color: porange),
                                  title: Text(
                                    "Desativar conta",
                                    style: defaultFont(
                                        16, FontWeight.normal, Colors.red),
                                  ),
                                  onTap: () {
                                    _showDialog(Alert_Box(
                                      buttons: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              deleteAccount(context);
                                            },
                                            child: Text("Sim",
                                                style: defaultFont(14,
                                                    FontWeight.bold, porange))),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Não",
                                                style: defaultFont(14,
                                                    FontWeight.bold, porange))),
                                      ],
                                      title: "Deletar Conta",
                                      text:
                                          "Você deseja deleter permanentemente sua conta?",
                                    ));
                                  }),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 10.0),
                  FadeAnimation(
                      0.5,
                      500,
                      100.0,
                      0.0,
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Configurações",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                  SizedBox(height: 10.0),
                  FadeAnimation(
                      0.5,
                      500,
                      100.0,
                      0.0,
                      Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              // ListTile(
                              //     onTap: () {
                              //       Switch(
                              //         value: true,
                              //         onChanged: (bool value) {},
                              //       );
                              //     },
                              //     leading: Icon(Icons.notifications,
                              //         color: Colors.black),
                              //     title: Text(
                              //       "Notificações",
                              //       style: defaultFont(
                              //           16, FontWeight.normal, Colors.black),
                              //     )),
                              // Divider(height: 10.0, color: Colors.grey),
                              ListTile(
                                leading: Icon(Icons.headset_mic,
                                    color: Colors.black),
                                title: Text(
                                  "Suporte",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                                onTap: () {
                                  _suporte(context);
                                },
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ))
        ],
      ),
    ));
  }

  Widget _suporte(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 50),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Suporte",
                        style: defaultFont(20, FontWeight.bold, porange),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
                content: Column(
                  children: <Widget>[
                    Text(
                      "Formas de antedimento:",
                      style: defaultFont(20, FontWeight.w500, porange),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.call,
                            size: 25,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "(81) 99530-3343",
                          style: defaultFont(16, FontWeight.bold, Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.email, size: 25),
                          onPressed: () {},
                        ),
                        Text(
                          "plusultragrp@gmail.com",
                          style: defaultFont(16, FontWeight.bold, Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text("Informações",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: porange)),
                    SizedBox(height: 35),
                    Text(
                        " O FAQ da Plusfit é composto por assistentes que irão sanar todas as suas dúvidas sobre o aplicativo, além de receber sugestões e avisos sobre eventuais erros para correção.\n\n  Agradecemos desde já.\n\n  Supere seus limites, Plus Ultra!")
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget bordaEdit() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          height: 220,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text("Escolha uma opção:",
                  style: defaultFont(20, FontWeight.bold, Colors.black)),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton.icon(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    label: Text("Camera"),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton.icon(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    label: Text("Galeria"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size(100, 35),
                      backgroundColor: porange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35))),
                  onPressed: () {
                    setState(() {
                      uploadImageToFirebase(context);
                      user.updateProfile(photoURL: downloadUrl);
                      imageCache.clear();
                      imageCache.clearLiveImages();
                    });
                  },
                  child: Text(
                    "Salvar",
                    style: defaultFont(14, FontWeight.bold, Colors.white),
                  ))
            ],
          ),
        ));
  }
}

class Treinos extends StatefulWidget {
  @override
  _TreinosState createState() => _TreinosState();
}

class _TreinosState extends State<Treinos> {
  final _formKey = GlobalKey<FormState>();

  Controller _controller = Controller();

  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  var indicativo;
  var dic = {};
  String dropdownValue = 'Todos';
  String dropdownValue2 = 'Todas';

  _conection(imc) {
    return FirebaseFirestore.instance
        .collection('treinos')
        .where('indicativo', isEqualTo: imc)
        .snapshots();
  }

  _validateConection() {
    if (!_formKey.currentState.validate()) return;
    indicativo = _controller
        .call(path: '/TreinoIndicado', params: {'params': jsonEncode(dic)});
  }

  _setValue() {
    dic['peso'] = _pesoController.text.trim();
    dic['altura'] = _alturaController.text.trim();
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['Nome'];
      var nivel = document['Nivel'];
      var image = document['image'];
      var tipo = document['Tipo'];
      var tempo = document['tempo'];
      return ExerciseContainer(
        color: dificult(nivel),
        width: 1,
        height: 100,
        top: 20,
        left: 20,
        right: 20,
        bottom: 0.0,
        image: "assets/$tipo/$image",
        text: "$nome",
        subtext: "Nivel: $nivel\nDuração: $tempo minutos",
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sugestão de Treino'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/back_treinos.png"),
                    fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          validator: (String value) {
                            return value.isEmpty ? 'Peso Inválido' : null;
                          },
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          style: defaultFont(
                              14, FontWeight.normal, pgreytextfield),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              labelText: 'Peso (em Kg)',
                              labelStyle: defaultFont(
                                  16, FontWeight.normal, pgreytextfield)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          validator: (String value) {
                            return value.isEmpty ? 'Altura Inválida' : null;
                          },
                          controller: _alturaController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          style: defaultFont(
                              14, FontWeight.normal, pgreytextfield),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              labelText: 'Altura (em centímetros)',
                              labelStyle: defaultFont(
                                  16, FontWeight.normal, pgreytextfield)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              child: Text("Buscar"),
                              style: ElevatedButton.styleFrom(
                                primary: porange,
                                textStyle: defaultFont(
                                    20, FontWeight.bold, Colors.black),
                                minimumSize: Size(370, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              onPressed: () {
                                setState(() {
                                  _setValue();
                                  _validateConection();
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 10.0, color: Colors.black),
                FutureBuilder(
                    future: indicativo,
                    builder: (BuildContext context, AsyncSnapshot snapshot1) {
                      if (snapshot1.hasData) {
                        var data = snapshot1.data;
                        return Flexible(
                          child: StreamBuilder(
                              stream: _conection(data['imc'].toString()),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );

                                  default:
                                    return ListView(
                                        children: makeListWidget(snapshot));
                                }
                              }),
                        );
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
