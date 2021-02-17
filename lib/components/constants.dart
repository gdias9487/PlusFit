import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Paleta de cores PlusFit
const pdarkred = Color(0xFF26020F);
const pblack = Color(0xFF140108);
const plightred = Color(0xFFA5062B);
const porange = Color(0xFFC12402);
const pyellow = Color(0xFFC79D0A);
const pgreytextfield = Colors.black54;

//Padding padrão entre campos

const double paddefault = 15;
const double padbutton = 20;
const double padroof = 30;

//Fontes

//const defaultfont = roboto

defaultFont(double size, weight, color) {
  return GoogleFonts.lato(
      textStyle: (TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          decoration: TextDecoration.none)));
}
