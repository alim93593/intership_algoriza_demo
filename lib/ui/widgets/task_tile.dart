
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componnents/main%20compenent/compenent.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/componnents/style/theme.dart';
import 'package:untitled/services/notification_service.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';


class TaskTile extends StatefulWidget {
   TaskTile({Key? key,required this.mylist}) : super(key: key);
   final  List mylist;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
   var notifyHelper= NotifyerHelper();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper.intializationNotification();
  }
  @override
  Widget build(BuildContext context) {
   final newTaskList= AppCubit.get(context).newtasks;
    return  ConditionalBuilder(
      condition: newTaskList.isNotEmpty,
      builder: (context) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if(newTaskList[index]['repeat']=='Daily'){
            DateTime date = DateFormat.jm().parse(newTaskList[index]['starttime'].toString());
            var myTime = DateFormat("HH:mm").format(date);
            debugPrint(myTime);
            notifyHelper.scheduleNotification(
              int.parse(myTime.toString().split(":")[0]),
              int.parse(myTime.toString().split(":")[1]),
              newTaskList[index]
            );
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _showBottomSheet(context,newTaskList[index]);
                        },
                        child: builditem(widget.mylist[index], context),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          if(newTaskList[index]['date']==DateFormat.yMd().format(AppCubit.get(context).selectedDate)){
            notifyHelper.displayNotification(
              model: AppCubit.get(context).newtasks[index]
            );
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _showBottomSheet(context,newTaskList[index]);
                        },
                        child: builditem(widget.mylist[index], context),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 70,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'NO Tasks Yet, Add Some New Tasks',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            );
          }
        },
        itemCount: widget.mylist.length, // itemCount: tasks.length
      ),
      fallback: (context) => Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 70,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'NO Tasks Yet, Add Some New Tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
    );
  }

   builditem(Map model, context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getBGClr(model['color'])
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${model['title']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        model['iscompleted']==1?Icons.check_circle_outline:Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      SizedBox(width: 6,),
                      Text(
                        '${model['starttime']} - ${model['endtime']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[100],
                        ),
                      ),
                       // SizedBox(height: 20),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   height: 80,
                      //   width: 2,
                      //   color: Colors.grey[200]!.withOpacity(0.7),
                      // ),
                      // RotatedBox(
                      //   quarterTurns: 3,
                      //   child: Text(
                      //     model['iscompleted']==1?"COMPLETED":"TODO",
                      //     style: TextStyle(
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.white
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text(
                    '${model['note']}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              width: 2,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                model['iscompleted']==1?"COMPLETED":"TODO",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
    )
   );
  }
   getBGClr(int no){
     switch(no){
       case 0:
         return bluishClr;
       case 1:
         return pinkClr;
       case 2:
         return yellowClr;
       default:
         return bluishClr;
     }
   }

  _showBottomSheet(context,Map model){
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        builder: (context){
          return  Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0)),
              color: AppCubit.get(context).isDark?darkGreyClr:Colors.white,
            ),
          padding: EdgeInsets.only(top: 4),
          height: model['iscompleted']==1?MediaQuery.of(context).size.height*0.24:MediaQuery.of(context).size.height*0.32,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppCubit.get(context).isDark?Colors.grey[600]:Colors.grey[300],
                ),
              ),
              Spacer(),
              model['iscompleted']==1?Container():bottomsheetButton(
                  context: context,
                  label: 'Task Completed',
                  ontap: (){
                    AppCubit.get(context).updatedatabase(status: 1, id: model['id']);
                    Navigator.pop(context);
                    customSnackBar(context: context,title: 'Task Have Been Completed Successfully');
                  },
                  clr: primaryClr
              ),
              SizedBox(height: 10,),
              bottomsheetButton(
                  context: context,
                  label: 'Add To Favorite',
                  ontap: (){
                    AppCubit.get(context).updatedatabase(status: 2, id: model['id']);
                    Navigator.pop(context);
                    customSnackBar(context: context,title: 'Task Have Been Add To Favorite Successfully');
                  },
                  clr: yellowClr,
              ),
              SizedBox(height: 10,),
              bottomsheetButton(
                  context: context,
                  label: 'Delete Task',
                  ontap: (){
                    AppCubit.get(context).deleteFromDataBase(id: model['id']);
                    Navigator.pop(context);
                    customSnackBar(context: context,title: 'Task Have Been Deleted Successfully');
                  },
                  clr: Colors.red[300]!
              ),
              SizedBox(height: 10,),
              bottomsheetButton(
                  context: context,
                  label: 'Close',
                  ontap: (){
                    Navigator.pop(context);
                  },
                  clr: Colors.red[300]!,
                  isClosed: true
              ),
              SizedBox(height: 10,),
            ],
          ),
           );
        }
    );

   }

   bottomsheetButton({required String label,required Function()? ontap,required Color clr,bool isClosed =false,context }){
   return GestureDetector(
     onTap: ontap,
     child: Container(
       margin: const EdgeInsets.symmetric(vertical: 4),
       height: 40,
       width: MediaQuery.of(context).size.width*0.9,
       decoration: BoxDecoration(
         border: Border.all(
           width: 2,
           color: isClosed==true? AppCubit.get(context).isDark?Colors.grey[600]!:Colors.grey[300]!:clr
         ),
         borderRadius: BorderRadius.circular(20),
         color: isClosed==true?Colors.transparent:clr
       ),
     child: Center(
        child: Text(
           label,
          style: isClosed?titleStyle():titleStyle().copyWith(color: Colors.white),
          textAlign: TextAlign.center,
       ),
     ),
     ),
   );
   }
}