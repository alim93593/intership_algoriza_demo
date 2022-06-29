// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables, override_on_non_overriding_member, annotate_overrides, avoid_unnecessary_containers, unused_import

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componnents/main%20compenent/button.dart';
import 'package:untitled/componnents/main%20compenent/compenent.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/componnents/style/theme.dart';
import 'package:untitled/services/notification_service.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';
import 'package:untitled/ui/app_main_cubit/state.dart';
import 'package:untitled/ui/widgets/add_task_bar.dart';
import 'package:untitled/ui/widgets/task_tile.dart';
import 'package:untitled/ui/widgets/task_tile_done.dart';
import 'package:untitled/ui/widgets/task_tile_favorite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  var notifyHelper= NotifyerHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper.intializationNotification();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
       return   DefaultTabController(
         length: 3,
         child: Scaffold(
              appBar:appbar(
                  isAction: true,
                  isLeading:true,
                  title: 'Taskaty',
                  isTabShow: true,
                  context: context,
                  myIcon:AppCubit.get(context).isDark? Icons.wb_sunny_rounded:Icons.nightlight_round_rounded,
                  mycolor:AppCubit.get(context).isDark?Colors.white:Colors.black ,
                  ontap: (){
                    AppCubit.get(context).changeAppMode();
                  },
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              body:TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addTaskBar(showButton: true),
                      addDateBar(),
                      SizedBox(height: 10,),
                      showNewTask(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addTaskBar(showButton: false),
                      addDateBar(),
                      SizedBox(height: 10,),
                      showFavoriteTask(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addTaskBar(showButton: false),
                      addDateBar(),
                      SizedBox(height: 10,),
                      showFDoneTask(),
                    ],
                  ),
                ],
              ) ,
            ),
       );
        // );
      },
    );
  }
  addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey
        ),
        dayTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey
        ),
        monthTextStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
        ),
        onDateChange: (date){
          // setState(() {
            selectedDate = date;
            AppCubit.get(context)..changeDatetime(date);
            print(AppCubit.get(context).selectedDate);
          // });
          // print(selectedDate);
        },
      ),
    );
  }
  addTaskBar({required bool showButton}){
    return Container(
      margin: const EdgeInsets.only(left: 8,right: 8,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),style: subHeadingStyle(),),
              Text('Today',style: headingStyle(),)
            ],
          ),
        showButton==true?   MyButton(label: '+ Add Task', onTap: ()=>{
            navigateto(context, AddTaskPage())

          }):Container()
        ],
      ),
    );
  }
  showNewTask(){
    return Expanded(
          child: TaskTile(mylist: AppCubit.get(context).newtasks,),
    );
  }
  showFavoriteTask(){
    return Expanded(
      child: TaskFavoriteTile(mylist: AppCubit.get(context).archivetasks,),
    );
  }
  showFDoneTask(){
    return Expanded(
      child: TaskDoneTile(mylist: AppCubit.get(context).donetasks,),
    );
  }
}
