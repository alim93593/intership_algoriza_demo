// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:untitled/componnents/default_text_button.dart';
import 'package:untitled/componnents/main_componnents.dart';


// ignore: must_be_immutable
class DemoRegisterScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style:Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black
                    ),
                  ),
                  Text(
                      'Register Now to communicate with friends',
                      style:Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey
                      )
                  ),
                  SizedBox(height: 15.0,),
                  DefaultFormFeild(
                      controller: namecontroller,
                      type: TextInputType.name,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                      label: 'User Name',
                      prefix: Icons.person_outline
                  ),
                  SizedBox(height: 20.0,),
                  DefaultFormFeild(
                      controller: emailcontroller,
                      type: TextInputType.name,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Please Enter Your Email Address';
                        }
                        if(!value.toString().contains('@')){
                          return 'Please Enter Avalid Email Address';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined
                  ),
                  SizedBox(height: 15.0,),
                  DefaultFormFeild(
                      controller: passwordcontroller,
                      type: TextInputType.visiblePassword,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Please Enter Your Phone';
                        }
                        return null;
                      },
                        label: 'Phone Number',
                        prefix: Icons.phone
                  ),
                  SizedBox(height: 15.0,),
                  DefaultFormFeild(
                      controller: phonecontroller,
                      type: TextInputType.phone,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Please Enter Your Phone';
                        }
                        return null;
                         },
                          sufix: Icons.visibility_outlined,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                         ispassword: true,
                      ),
                  SizedBox(height: 25.0,),
                  defaultButton(
                    function: (){
                      if(formkey.currentState!.validate()){
                        print('welcome');
                      }
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
