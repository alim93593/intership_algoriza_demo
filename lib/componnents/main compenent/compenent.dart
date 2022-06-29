// ignore_for_file: invalid_required_positional_param, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';




 appbar({context, Function()? ontap, IconData? myIcon,Color? mycolor,String? title,bool? isLeading,bool? isAction,List<Widget>? actions,List<Widget>? myWidget,bool? isTabShow}){
  return AppBar(
    centerTitle: true,
    bottom:isTabShow==true? TabBar(
      indicatorColor: Colors.grey,
      labelColor:AppCubit.get(context).isDark?Colors.white:Colors.black,
      unselectedLabelColor:Colors.grey,
        tabs: [
          Tab(
            icon: Icon(Icons.list_alt_rounded,color:AppCubit.get(context).isDark?Colors.white: Colors.black,),
            text: "New Tasks",
          ),
          Tab(
            icon: Icon(Icons.favorite_border_outlined,color:AppCubit.get(context).isDark?Colors.white: Colors.black,),
            text: "Favorite Tasks",

          ),
          Tab(
            icon: Icon(Icons.check_circle_outline,color:AppCubit.get(context).isDark?Colors.white: Colors.black,),
            text: "Done Tasks",
          ),
        ],
    ):null,
    title: Text(title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: primaryClr),),
    elevation: 0,
    backgroundColor: ThemeData().appBarTheme.backgroundColor,
    leading:isLeading==true? GestureDetector(
      onTap:ontap,
      child: Icon(
        myIcon,
        size: 30,
        color: mycolor,
      ),
    ):Container(),
    actions:actions
  );
}
 void showtoast({required String text,required ToastStates state})=> Fluttertoast.showToast(
    msg:text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
 enum ToastStates{SUCCESS,ERROR,WARINING}
 Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARINING:
      color = Colors.yellowAccent;
      break;
  }
  return color;
}
 void navigateto(context, widget) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
 void navigateandfinish(context, widget) =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget),(route){
  return false;
});
 customSnackBar({context,required String title}){
   return   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
       content: Text(
         title
     ),
   ));
 }
 Widget defaultTextButton({required String text,  Function()? function,required Color myColor}) => TextButton(
  onPressed: function,
  child: Text(text.toUpperCase(),
      style: TextStyle(
          color: myColor,
          fontSize: 16
      )),
);
 Widget defaultButton({double width = double.infinity,Color background = Colors.blue,bool isuppercase = true,double radius = 10.0,double height=40.0,required Function()? function,required String text,})=>Container(
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
Widget imageContainer({@required url,double width = 10.0,double containerWidth = 120.0,double containerHeight = 120.0,BoxFit boxFit =BoxFit.cover }) => Container(
  width: containerWidth,
  height: containerHeight,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(width),
      image: DecorationImage(image: url, fit: boxFit)),
);