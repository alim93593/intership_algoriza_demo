// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/shared/local_data/cache_helper.dart';
import 'package:untitled/ui/app_main_cubit/state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];
  int currentindex = 0;
  DateTime selectedDate = DateTime.now();
  String startedTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "9:30 PM";
  Database? database;
  bool isDark = false;
  bool changePassword=false;
  bool isAgree=false;
  ////main theme and date time methods
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putBollean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
  void changeContainerColor(int myIndex){
      currentindex =myIndex;
      debugPrint('CustomContainerColorState');
    emit(CustomContainerColorState());

  }
  void changeDatetime(DateTime myDate){
    selectedDate = myDate;
    emit(ChangeDateTimeState());

  }
  void changeStarttime(String myDate){
    startedTime = myDate;
    emit(ChangeStartTimeState());
  }
  void changeEndtime(String myDate){
    endTime = myDate;
    emit(ChangeStartTimeState());
  }


  //// main method to insert update delete to sqflite database
  void getDataFromdatabase(database) {
    newtasks = [];
    archivetasks = [];
    donetasks = [];
    emit(GetDatafromDatabaseLoadinstate());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (int.parse(element['iscompleted'].toString()) == 0) {
          newtasks.add(element);
        } else if (int.parse(element['iscompleted'].toString()) == 1) {
          donetasks.add(element);
          print('no arch tasks');
        } else {
          archivetasks.add(element);
        }
      });
      emit(GetDatafromDatabaseState());
    });
  }
  void createdatabase() {
    // deleteDatabase("todo.db");
    // print('deleted success');
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      print('database created');
      await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, note TEXT, date TEXT, starttime TEXT, endtime TEXT, remind INTEGER, repeat TEXT, color INTEGER, iscompleted INTEGER)')
          .then((value) {
        print('table has been created');
      }).catchError((error) {
        print('Error When Creating Table${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromdatabase(database);
      print(newtasks.length);
      print('database opend');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }
  void deleteFromDataBase({required int? id}) {
    database!.rawDelete('DELETE FROM tasks WHERE id =?',[id]).then((value) {
      print('database deleted');
      getDataFromdatabase(database);
      emit(DeleteDataBaseState());
    });
  }
  void updatedatabase({required int status, required int id}) async {
    database!.rawUpdate('UPDATE tasks Set iscompleted = ? WHERE id=?',
        [status, id]).then((value) {
      print('database updated');
      getDataFromdatabase(database);
      emit(UpdateDataBaseState());
    });
  }
  void inserttodatabase({String? title,String? note,String? date,String? starttime,String? endtime,int? remind,String? repeat,int? color,int? iscompleted}) async {
    await database!.transaction((txn) {
    return  txn.rawInsert(
          'INSERT INTO tasks(title, note, date, starttime, endtime, remind, repeat, color, iscompleted) VALUES("$title", "$note", "$date", "$starttime", "$endtime", $remind, "$repeat",$color, $iscompleted)')
          .then((value) {
        emit(InserttoDatabaseState());
        print('$value inserted successfully');
        // print(value.toString());
        getDataFromdatabase(database);
      }).catchError((error) {
        print(error.toString());
        print('Error When Insert Record${error.toString()}');
      });
      // return null as Future;
    });
  }
}
