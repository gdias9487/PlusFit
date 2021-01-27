import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",),
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
                image: AssetImage("assets/backperfil.png"), fit: BoxFit.cover),
>>>>>>> 32db69fda2f40e5c30b5f328e020108b811d9065
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
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            DefaultElevatedButton(
                                color: Colors.black,
                                fontSize: 12,
                                height: 60,
                                radius: 25,
                                width: 30,
                                text: 'Editar',
                                action: () {}),
                            SizedBox(
                              width: 25,
                            ),
                            DefaultElevatedButton(
                              color: Colors.black,
                              fontSize: 12,
                              height: 60,
                              radius: 25,
                              width: 30,
                              text: 'Desconectar',
                              action: () {
                                context.read<AuthenticationService>().signOut();
                                if (firebaseUser == null) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
<<<<<<< HEAD
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
=======
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
                      ButtonTheme(
                        height: 30.0,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, "/edit");
                            },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: Colors.red)),
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.black, fontSize: 12.0),
>>>>>>> 32db69fda2f40e5c30b5f328e020108b811d9065
                          ),
                          title: Text(
                            "Training",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          onTap: () {},
                        ),
<<<<<<< HEAD
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.vpn_key, color: Colors.black),
                          title: Text(
                            "Change Password",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          onTap: () {},
=======
                      ),
                      //Container(
                       // height: 30.0,
                       // width: 60.0,
                       // decoration: BoxDecoration(
                           // border: Border.all(color: Colors.red),
                           // color: Colors.grey[100],
                           // borderRadius: BorderRadius.circular(20.0)),
                        //child: Center(
                         // child: Text(
                            //"Edit",
                           // style:
                                //TextStyle(color: Colors.black, fontSize: 12.0),
                          //),
                        //),
                      //),
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
>>>>>>> 32db69fda2f40e5c30b5f328e020108b811d9065
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.verified, color: Colors.black),
                          title: Text(
                            "Upgrade Account",
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
                      ],
                    ),
                  ),
                ),
<<<<<<< HEAD
                SizedBox(height: 20.0),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
=======
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
>>>>>>> 32db69fda2f40e5c30b5f328e020108b811d9065
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
