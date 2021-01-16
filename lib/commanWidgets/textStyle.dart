import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFE3F2FD);
  static const Color titleTextColor = Color(0xFF0D47A1);
  static const Color subTitleTextColor = Color(0xFF1565C0);
  static const Color bodyColor= Colors.blueGrey;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,



  );


  static final TextTheme lightTextTheme = TextTheme(
    title: _titleLight,
    headline:_titleLight.copyWith(color: Colors.white),
    subhead: _description.copyWith(color: Colors.white),
    display1: _description,

  );



  //for topics


  static final TextStyle _titleLight = TextStyle(
      color: titleTextColor,
      fontSize:30,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto",

  );


  // for DESCRIPTION


  static final TextStyle _description = TextStyle(
    color: subTitleTextColor,
    fontFamily: "Roboto",
    fontSize: 17,
      fontWeight: FontWeight.normal

  );


}

