import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch:Colors.blue ,
    // inputDecorationTheme: InputDecorationTheme(
    // hintStyle: TextStyle(color: Colors.red),
    // labelStyle: TextStyle(color:Colors.red )
    // ),
    // primaryColor: Colors.redAccent,
    // primaryColorDark: Colors.red,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black, size: 25.0),
      titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Jannah'
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      // backgroundColor: Colors.blue
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 20.0,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
    ),
);