// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componnents/main%20compenent/button.dart';
import 'package:untitled/componnents/main%20compenent/compenent.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/componnents/style/theme.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';
import 'package:untitled/ui/app_main_cubit/state.dart';
import 'package:untitled/ui/widgets/input_field.dart';
import 'home_page.dart';




class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String startedTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "9:30 PM";
  int selectedRemind=5;
  List<int>remindList=[5,10,15,20];
  String selectedRepeat="None";
  List<String> repeatList=["None","Daily","Weekly"];
  int selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
     listener: (context,state){},
     builder: (context,state){
       return  Scaffold(
         backgroundColor: Theme.of(context).backgroundColor,
         appBar: appbar(
             isAction: false,
             isLeading: true,
             title: 'Taskaty',
             context: context,
             myIcon: Icons.arrow_back_ios,
             mycolor:AppCubit.get(context).isDark?Colors.white:Colors.black ,
             ontap: (){
               navigateandfinish(context, HomePage());
             }
         ),
         body: Container(
           padding: const EdgeInsets.only(left: 15,right: 15),
           child: SingleChildScrollView(
             physics:BouncingScrollPhysics(),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Add Task',
                   style: headingStyle(),
                 ),
                 MyInputFeild(label: "Title", hint: "Enter Your Title",controller: titleController,),
                 MyInputFeild(label: "Note", hint: "Enter Your Note",controller: noteController,),
                 MyInputFeild(label: "Date", hint: DateFormat.yMd().format(selectedDate),
                   widget: IconButton(
                     icon: Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                     onPressed: (){
                       getDateFromUser(context);
                     },

                   ),),
                 Row(
                   children: [
                     Expanded(
                       child: MyInputFeild(
                         label: "Start Time",
                         hint: startedTime,
                         widget: IconButton(
                           icon: Icon(Icons.access_time_rounded,color: Colors.grey,),
                           onPressed: (){
                             AppCubit.get(context).changeStarttime(startedTime);
                             getTimeFromUser(context, isStartTime: true);
                           },
                         ),
                       ),
                     ),
                     SizedBox(width: 12.0,),
                     Expanded(
                       child: MyInputFeild(
                         label: "End Time",
                         hint: endTime,
                         widget: IconButton(
                           icon: Icon(Icons.access_time_rounded,color: Colors.grey,),
                           onPressed: (){
                             AppCubit.get(context).changeStarttime(endTime);
                             getTimeFromUser(context, isStartTime: false);
                           },
                         ),
                       ),
                     ),
                     // Container(
                     //   padding: EdgeInsets.only(top: 10,bottom: 2),
                     //     child: Icon(Icons.add))
                   ],
                 ),
                 MyInputFeild(label: 'Remind', hint: "$selectedRemind minute early",
                     widget: DropdownButton(
                       icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                       iconSize: 32,
                       elevation: 4,
                       style: subtitleStyle(context),
                       underline: Container(height: 0,),
                       onChanged: (String? newvalue){
                         setState(() {
                           selectedRemind = int.parse(newvalue!);
                         });
                       },
                       items: remindList.map<DropdownMenuItem<String>>((int value){
                         return DropdownMenuItem<String>(
                           value: value.toString(),
                           child: Text(value.toString()),
                         );
                       }
                       ).toList(),

                     )
                 ),
                 MyInputFeild(label: 'Repeat', hint: "$selectedRepeat minute early",
                     widget: DropdownButton(
                       icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                       iconSize: 32,
                       elevation: 4,
                       style: subtitleStyle(context),
                       underline: Container(height: 0,),
                       onChanged: (String? newvalue){
                         setState(() {
                           selectedRepeat = newvalue!;
                         });
                       },
                       items: repeatList.map<DropdownMenuItem<String>>((String value){
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value,style: TextStyle(color: Colors.grey),),
                         );
                       }
                       ).toList(),
                     )
                 ),
                 SizedBox(height: 15,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     colorPallete(),
                     MyButton(label: 'Create Task', onTap: (){
                       validateData();
                     })
                   ],
                 ),
               ],
             ),
           ),
         ),
       );
     },
    );
  }
  getDateFromUser(context)async{
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1998),
        lastDate: DateTime(21160)
    );
    if(pickerDate !=null){
      AppCubit.get(context).changeDatetime(selectedDate);
      selectedDate = pickerDate;
    }else{
      print('null');
    }
  }
  getTimeFromUser(context,{required bool isStartTime})async{
    var pickedtime = await showtimePicker();
    String? formatedTime= pickedtime?.format(context!);
    if(pickedtime==null){
    }else if(isStartTime==true){
      AppCubit.get(context).changeStarttime(startedTime);
      startedTime=formatedTime!;
    }else if(isStartTime==false){
      AppCubit.get(context).changeEndtime(endTime);
      endTime=formatedTime!;
      print(endTime);
    }
  }
  showtimePicker(){
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startedTime.split(":")[0]),
            minute: int.parse(startedTime.split(":")[1].split(" ")[0])
        )
    );
  }
  colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: titleStyle(),),
        SizedBox(height: 8,),
        Wrap(
          children:
          List<Widget>.generate(
              3,
               ( int   index) {
                return GestureDetector(
                  onTap: (){
                   AppCubit.get(context).changeContainerColor(index);
                    selectedColor=index;
                    print(selectedColor);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor:index==0?primaryClr: index==1? pinkClr:yellowClr,
                      child:selectedColor==index? Icon(Icons.done,color: Colors.white,size: 16,):Container(),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
  validateData(){
    if(titleController.text.isNotEmpty&&noteController.text.isNotEmpty){
      AppCubit.get(context).inserttodatabase(
          title: titleController.text,
          note: noteController.text,
          date: DateFormat.yMd().format(selectedDate),
          starttime: startedTime,
          endtime: endTime,
          remind: selectedRemind,
          repeat: selectedRepeat,
          color: selectedColor,
          iscompleted: 0
      );
      titleController.clear();
      noteController.clear();
      customSnackBar(context: context,title: 'Task Have Been Submitted Successfully');
      navigateto(context, HomePage());
    }else if(titleController.text.isEmpty||noteController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "All Fields Are Required !"
        ),
      ));
    }
  }
}
