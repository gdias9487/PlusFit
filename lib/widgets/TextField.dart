import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';

class DefaultTextField extends StatelessWidget {
  final Key key;
  final bool obscureText;
  final String text;
  final action;
  final prefixicon;
  final suffixicon;
<<<<<<< HEAD
  final prefix;
  final suffix;
=======
  final controler;
>>>>>>> 893cfbacec4fec9c5f5f2736506a722816a2ef72

  const DefaultTextField(
      {this.key,
      @required this.obscureText,
      @required this.text,
      this.action,
      this.prefixicon,
<<<<<<< HEAD
      this.prefix,
      this.suffix,
      this.suffixicon});
=======
      this.suffixicon,
      this.controler});
>>>>>>> 893cfbacec4fec9c5f5f2736506a722816a2ef72

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controler,
        obscureText: obscureText,
        style: new TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            fillColor: Colors.blue,
            prefixIcon: Icon(prefixicon),
            prefix: prefix,
            suffix: suffix,
            suffixIcon: Icon(suffixicon),
            labelText: text,
            labelStyle: TextStyle(color: pgreytextfield)),
            
      ),
    );
  }
}
