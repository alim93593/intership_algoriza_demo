// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/componnents/style/theme.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';

class MyInputFeild extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  TextInputType? type;
  Function(String)? onsubmit;
  Function(dynamic)? onchanged;
  VoidCallback? onTap;
   dynamic validate;
  IconData? prefix;
  IconData? sufix;
  VoidCallback? sufixpressed;
  bool ispassword;
  bool isTextPassword;
   MyInputFeild(
      {Key? key,
      required this.label,
      required this.hint,
      this.widget,
      this.controller,
      this.type,
      this.onTap,
      this.ispassword =false,
      this.onsubmit,
      this.sufixpressed,
      this.sufix,
      this.prefix,
      this.onchanged,
      this.validate,
      this.isTextPassword=false
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTextPassword==true? TextFormField(
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onsubmit,
      onTap: onTap,
      onChanged: onchanged,
      obscureText: ispassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            // backgroundColor: Colors.white
        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: sufix != null
            ? IconButton(
          onPressed: sufixpressed,
          icon: Icon(sufix),
        )
            : null,
      ),
      validator: validate,
    ):Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: titleStyle(),
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              padding: EdgeInsets.only(left: 14),
              height: 52,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child:
           Row(
            children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      keyboardType: type,
                      controller: controller,
                      onFieldSubmitted: onsubmit,
                      onTap: onTap,
                      onChanged: onchanged,
                      obscureText: ispassword,
                      cursorColor: AppCubit.get(context).isDark ? Colors.grey[100]: Colors.grey[700],
                      style: subtitleStyle(context),
                      decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtitleStyle(context),
                      // prefixIcon: Icon(prefix),
                      // suffixIcon: sufix != null? IconButton( onPressed: sufixpressed, icon: Icon(sufix),): null,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide( width: 0,color: Theme.of(context).backgroundColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide( width: 0,color: Theme.of(context).backgroundColor),
                        ),

                      ),
                      validator: validate,
                    ),
                  ),
                  widget == null? Container(): Container(child: widget)
                ],
              )
    ),
        ],
      ),
    ) ;
  }
}
