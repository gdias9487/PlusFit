import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';

import '../../components/constants.dart';
import '../../components/constants.dart';


class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Desconectar"),
          content: new Text("Você Deseja Realmente Sair ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Sim, Sair"),
              onPressed: () {
                Navigator.pushNamed(context, '/home'); 
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
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(65.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              offset: Offset(0, 5.0),
                              color: Colors.black38),
                        ],
                        image: DecorationImage(
                            image: AssetImage("assets/homem.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Carlos Dias Ernandes",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            DefaultElevatedButton(
                                color: porange,
                                fontSize: 12,
                                height: 60,
                                radius: 25,
                                width: 30,
                                text: 'Editar',
                                action: () {
                                  Navigator.pushNamed(context, "/edit");
                                }),
                            SizedBox(
                              width: 25,
                            ),
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
}
