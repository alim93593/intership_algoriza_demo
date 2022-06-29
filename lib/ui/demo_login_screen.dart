// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:untitled/componnents/default_form_feild.dart';
=======
import 'package:untitled/componnents/default_text_button.dart';
>>>>>>> 1d28606ef00a72245536233689fd44dd4867c17f
import 'package:untitled/componnents/main_componnents.dart';
import 'package:untitled/ui/demo_register_screen.dart';


class DemoLoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Text(
                    'Login Now to E-commerce App',
                    style:Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                          'Please Select Your Country',
                          style:Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey
                          )
=======
                  Row(
                    children: [
                      Text(
                        'LOGIN',
                        style:Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black
                        ),
>>>>>>> 1d28606ef00a72245536233689fd44dd4867c17f
                      ),
                      Container(
                        child: CountryCodePicker(
                          onChanged: print,
<<<<<<< HEAD
                          initialSelection: 'IT',
                          favorite: ['+39','FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
=======
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IT',
                          favorite: ['+39','FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
>>>>>>> 1d28606ef00a72245536233689fd44dd4867c17f
                          alignLeft: false,
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
=======
                  Text(
                      'Login Now to communicate with friends',
                      style:Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey
                      )
                  ),
>>>>>>> 1d28606ef00a72245536233689fd44dd4867c17f
                  SizedBox(height: 30.0,),
                  DefaultFormFeild(
                      controller: emailcontroller,
                      type: TextInputType.emailAddress,
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
                      ispassword: true,
                      validate: ( value){
                        if(value.isEmpty){
                          return 'Please Enter Your Password';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock_outline
                  ),
                  SizedBox(height: 15.0,),
                  defaultButton(
                    function: (){
                      if(formkey.currentState!.validate()){
                       print('welcome');
                      }
                    },
                    text: 'Login',
                  ),
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account?',
                          style:Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.black
                          )
                      ),
                      defaultTextButton(
                        myColor: Colors.black,
                          text: 'register now',
                          function: (){
                            navigateto(context, DemoRegisterScreen());
                          }
                      ),

                    ],
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
