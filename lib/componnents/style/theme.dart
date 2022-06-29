// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';


ThemeData darkTheme = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: darkGreyClr,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white, size: 25.0),
      titleTextStyle: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:darkGreyClr,
        statusBarIconBrightness: Brightness.light,
      ),
    )

);
ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white, size: 25.0),
      titleTextStyle: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    )
);



TextStyle  subHeadingStyle() =>TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppCubit().isDark?Colors.grey[400]:Colors.grey
);
TextStyle  headingStyle() =>TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
);
TextStyle  titleStyle() =>TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
);
TextStyle  subtitleStyle(context) =>TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color:AppCubit.get(context).isDark?Colors.grey[100]:Colors.grey[400]
);