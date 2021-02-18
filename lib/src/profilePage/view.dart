import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/src/profilePage/models.dart';
import 'package:plusfit/widgets/AlertDialog.dart';
import 'package:plusfit/widgets/animations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../components/constants.dart';
import '../../components/constants.dart';
import '../../components/constants.dart';

var profilephoto = GetUserImage(FirebaseAuth.instance.currentUser.email);
var profilename = GetUserName(FirebaseAuth.instance.currentUser.email);

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // ignore: unused_field
  final ImagePicker _picker = ImagePicker();
  File _imageFile;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}

  final picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = _firebaseAuth.currentUser.email;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profilephotos/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    taskSnapshot.ref.getDownloadURL().then((value) => setState(() {
          profilephoto = GetUserImage(_firebaseAuth.currentUser.email);
        }));
  }

  @override
  Widget build(BuildContext context) {
    logoff(firebaseUser) {
      _firebaseAuth.signOut();
      print(_firebaseAuth.currentUser);
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

    _fetchData() {
      profilephoto = GetUserImage(_firebaseAuth.currentUser.email);
      profilename = GetUserName(_firebaseAuth.currentUser.email);
    }

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
                          child: profilephoto,
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
                            profilename,
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
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: <Widget>[
                              ExpansionTile(
                                onExpansionChanged: (value) {},
                                children: showInfo(),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 16,
                                ),
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
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                leading:
                                    Icon(Icons.vpn_key, color: Colors.black),
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
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                leading: Icon(Icons.headset_mic_sharp,
                                    color: Colors.black),
                                title: Text(
                                  "Suporte",
                                  style: defaultFont(
                                      16, FontWeight.normal, Colors.black),
                                ),
                                onTap: () {_suporte(context);},
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
                                leading:
                                    Icon(Icons.block_outlined, color: porange),
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
                                leading: Icon(Icons.headset_mic,
                                    color: Colors.black),
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
              ))
        ],
      ),
    ));
  }
  Widget _suporte(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Suporte", style: TextStyle(fontSize: 20, color: porange),),
          content: Column(
              children: <Widget> [
                Text("Escolha a opção de atendimento:", style: TextStyle(fontWeight: FontWeight.w500),),
                IconButton(icon: Icon(Icons.android,size: 35,),onPressed: () {},),
                Text("Atendimento Ligação",style: TextStyle(fontSize: 12),),
                IconButton(icon: Icon(Icons.android,size: 35),onPressed: () {},),
                Text("Atendimento Email",style: TextStyle(fontSize: 12),),
                SizedBox(height:35),
                 Text("Informações", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: porange)), 
                SizedBox(height:35),
                Text("O FAQ da Plusfit é composto por assistentes que vão auxiliar bla bla bla bla bla bla bla bla")             
              ],
            ),
        );
      }
    );
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
                    uploadImageToFirebase(context);
                    FirebaseFirestore.instance
                        .collection("usuarios")
                        .doc(_firebaseAuth.currentUser.email)
                        .update({"image": _firebaseAuth.currentUser.email});
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
