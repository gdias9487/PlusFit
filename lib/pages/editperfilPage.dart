import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:image_picker/image_picker.dart';


class EditPage extends StatefulWidget {
  EditPage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyEditPageState createState() => _MyEditPageState();
}

class _MyEditPageState extends State<EditPage> {
  PickedFile _imagefile;
  final ImagePicker _picker = ImagePicker();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            title: Text("Editar Perfil",style: TextStyle(fontSize: 21),),
            backgroundColor: Colors.black,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
            },
            ),
          ),
      body: Container(
        padding: EdgeInsets.only(left:16, top:25, right: 16),
        child: ListView(
          children: <Widget> [
            perfilImagem(),
            SizedBox(
              height: 35,
            ),
            TextField(
             keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nome Completo",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.portrait,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Novo Email",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
               keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nova Senha",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Nova Altura",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.accessibility,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height:35),
             TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Novo Peso",
                hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                 icon: Icon(
                      Icons.height,
                      color: Colors.white,
                      size: 25.0,
                    ),
              ),
            ),
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              RaisedButton(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal:50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                onPressed: () {},
                child: Text("CANCELAR", style: 
                TextStyle(fontSize: 14,
                letterSpacing: 2.2,
                color: Colors.red),
                ), 
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal:50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("SALVAR", style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Colors.white
                ),
                ),
                ),
            ],)
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backedit.png"), fit: BoxFit.cover
          ),
        ),
      ),
    );
     
  }
  Widget perfilImagem() {
    return Center(
      child: Stack(
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
                  builder: ((builder) => Bordaedit()),
                );
              },
              child: Icon(Icons.edit, color: Colors.teal, size: 28.0,),
            ),
          ),
        ],
      ),
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