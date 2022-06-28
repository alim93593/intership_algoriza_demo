import 'package:flutter/material.dart';

class DefaultFormFeild extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? type;
  ValueChanged? onsubmit;
  Function()? onchanged;
  Function()? onTap;
  final FormFieldValidator? validate;
  String? label;
  IconData? prefix;
  IconData? sufix;
  Function()? sufixpressed;
  bool? ispassword;
   DefaultFormFeild(
      {Key? key,
      this.onsubmit,
      required this.validate,
      this.type,
      this.sufixpressed,
      this.sufix,
      this.prefix,
      this.onTap,
      this.onchanged,
      this.label,
      this.ispassword=false,
      this.controller}): super(key: key);

  @override
  Widget build(BuildContext context) {
        return  TextFormField(
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onsubmit,
      onTap: onTap,
      // onChanged: onchanged,
      obscureText: ispassword!,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.white
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
    );
  }
}

