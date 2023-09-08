import 'package:flutter/material.dart';

class Apptheme {
  final bool isDarkmode;

  Apptheme({this.isDarkmode = false});

  ThemeData getTheme() => ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.transparent),
      scaffoldBackgroundColor: isDarkmode ? Color.fromRGBO(255, 105, 105, 1): Colors.white,
      useMaterial3: true,
      textTheme: TextTheme(
        bodyMedium:  TextStyle( color: isDarkmode ? Color.fromRGBO(255, 105, 105, 1):  Color.fromRGBO(187, 37, 37, 1) , fontSize: 18 , fontFamily: "CherryBombOne"),
        bodyLarge:TextStyle(color:isDarkmode ? Color.fromRGBO(255, 105, 105, 1): Color.fromRGBO(187, 37, 37, 1)   , fontFamily: "CherryBombOne", fontSize: 40) ),
        primaryColor: Color.fromRGBO(239, 98, 98, 1),
        
      );
      
}
