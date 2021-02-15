import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../components/constants.dart';
import '../../components/constants.dart';
import '../../components/constants.dart';
import '../../components/constants.dart';
import '../signUpPage/controller.dart';


class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}
 

class _MyPerfilPageState extends State<PerfilPage> {
  PickedFile _imagefile;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final condicion = false;
  
  

  final ImagePicker _picker = ImagePicker();
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Desconectar"),
          content: new Text("Você Deseja Realmente Sair ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home'); 
              },
            ),
          ],
        );
      }
    );
  }

  
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.create),
              color: Colors.white,
              onPressed: () {
                 showModalBottomSheet(
                  context: context,
                  builder: ((builder) => _editar()),
                );
              },
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backperfil.png"),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    perfilImagem(),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nomeController.text,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          emailController.text,
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        
                        Row(
                          children: <Widget>[
                            DefaultElevatedButton(
                              color: porange,
                              fontSize: 12,
                              height: 60,
                              radius: 25,
                              width: 30,
                              text: 'Desconectar',
                              action: () {
                                _showDialog();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.assignment_turned_in_sharp,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Training",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.vpn_key, color: Colors.black),
                          title: Text(
                            "Change Password",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.headset_mic, color: Colors.black),
                          title: Text(
                            "Support",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.block_outlined, color: Colors.red),
                          title: Text(
                            "Deletar Conta",
                            style: TextStyle(fontSize: 19.0,color: Colors.red),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "App Notification",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Switch(
                              value: true,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _editar(){
    return Container(
       height: 1200.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 25,
      ),
      child: Column(
        children: <Widget>[
          Text("Editar Conta",
          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: porange),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField( 
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Novo Nome'),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField( 
              controller: emailController,
              decoration: InputDecoration(labelText: 'Novo Email'),
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(
            height: 25
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RaisedButton(
              child: Text("Alterar"),
              color: porange,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                condicion == true;
              },
            ),
          ),
        ],
      ),
    );
  }
   Widget perfilImagem() {
    return Stack(
      children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: _imagefile == null ? AssetImage("assets/homem.png") : FileImage(File(_imagefile.path)),
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
              child: Icon(Icons.edit, color: Colors.teal, size: 28.0,),
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
          Text("Escolha uma opção",style: TextStyle(
            fontSize: 20.0
          ),
          ),
          SizedBox(height:20),
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
  void takedPhoto (ImageSource source) async {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() {
        _imagefile = pickedFile;
      });
    }
}
