import 'package:flutter/material.dart';

Widget defaultTextButton({required String text, required Function() function,required Color myColor}) => TextButton(
      onPressed: function,
      child: Text(text.toUpperCase(),
      style: TextStyle(
        color: myColor,
        fontSize: 16
      )),
    );
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isuppercase = true,
  double radius = 10.0,
  double height=40.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isuppercase ? text.toUpperCase() : text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
        ),
        height: height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
void navigateto(context, widget) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateandfinish(context, widget) =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget),(route){
  return false;
});