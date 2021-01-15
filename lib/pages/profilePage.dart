import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                image: AssetImage("assets/backperfil.png"), fit: BoxFit.cover),
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
                      Container(
                        height: 30.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            "Edit",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
