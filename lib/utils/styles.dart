import 'package:flutter/material.dart';

class Styles {
  static const cardTitleText = TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold);
  static const cardBodyText = TextStyle(color: Colors.white, fontSize: 11,fontWeight: FontWeight.normal);

  static const cardContentText = TextStyle(color: Colors.redAccent, fontSize: 9,fontWeight: FontWeight.normal);
  static const appBarTitleText = TextStyle(color: Colors.white, fontSize: 16);

  static const cardBaseColor = Color(0xFFAEB7B3);
  static const cardExpandedColor = Color(0xFF011627);
  static const cardTextExpandBaseColor = Color(0xFFFFFFFF);

  //#BUTTONS

   static  ButtonStyle flatButtonStyle = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
);


}
