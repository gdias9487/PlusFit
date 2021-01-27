import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plusfit/authentication.dart';

class DefaultTextField extends StatelessWidget {
  final Key key;
  final bool obscureText;
  final String text;
  final action;
  final prefixicon;
  final suffixicon;
  final prefix;
  final suffix;
  final controler;
  final validator;

  const DefaultTextField(
      {this.key,
      @required this.obscureText,
      @required this.text,
      this.action,
      this.prefixicon,
      this.prefix,
      this.suffix,
      this.suffixicon,
      this.controler,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
    );
  }
}
