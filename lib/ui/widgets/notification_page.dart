import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/componnents/style/colors.dart';
import 'package:untitled/ui/app_main_cubit/cubit.dart';

class NotifiedPage extends StatelessWidget {
  NotifiedPage({Key? key,required this.label,required this.mylist}) : super(key: key);
  final String? label;
  final  List mylist;
  @override
  Widget build(BuildContext context) {
    final newTaskList= AppCubit.get(context).newtasks;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
           Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: AppCubit.get(context).isDark?Colors.white:Colors.grey,),
        ),
        title: Text (this.label.toString().split("|")[1],style: TextStyle(color:AppCubit.get(context).isDark?Colors.white:Colors.black),),
      ),
      body:   ConditionalBuilder(
      condition: newTaskList.isNotEmpty,
      builder: (context) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Center(child: builditem(mylist[index], context),),
              ],
            );
        },
        itemCount: mylist.length, // itemCount: tasks.length
      ),
      fallback: (context) => Container()
    ));
  }
  builditem(Map model, context) {
    return Center(
      child: Container(
          height: 200,
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
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          '${model['title']}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 18,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              model['iscompleted']==1?Icons.check_circle_outline:Icons.access_time_rounded,
                              color: Colors.grey[200],
                              size: 18,
                            ),
                            SizedBox(height: 30),
                            Text(
                              '${model['starttime']} - ${model['endtime']}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[100],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          '${model['note']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 250,
                  width: 2,
                  color: Colors.grey[200]!.withOpacity(0.7),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    model['iscompleted']==1?"COMPLETED":"TODO",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
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
}
