// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_const_constructors, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:untitled/ui/app_main_cubit/cubit.dart';
import 'package:untitled/ui/widgets/notification_page.dart';

import '../main.dart';


class NotifyerHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  intializationNotification() async {
    configureLocalTimezone();
    final IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );
    final AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification
    );
  }
  Future selectNotification(String? payload,{context}) async {
    if(payload==null)return;
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }else{
      debugPrint('notification payload: $payload');
    }
    await  MyApp.navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => NotifiedPage(label: payload, mylist: AppCubit.get(context).newtasks,)));
  }
  Future onDidReceiveLocalNotification(int? id, String? title, String? body,String? payload,{context}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: Text(title!),
            content: Text(body!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Ok'),
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen(payload),
                  //   ),
                  // );
                },
              )
            ],
          ),
    );
  }
  displayNotification({model}){
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'channel_id115',
        'Taskaty',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
        playSound: true,
        fullScreenIntent: true,
        color: Color.fromARGB(0, 12, 15, 35),
        ticker: 'ticker'

    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
     flutterLocalNotificationsPlugin.show(
        model['id'].toInt(),
        model['title'],
        model['note'],
        platformChannelSpecifics,
        payload: "${model['title']}|"+"${model['note']}|"
    );
  }
  scheduleNotification(int hour,int minutes,model)async{
    await flutterLocalNotificationsPlugin.zonedSchedule(
        model['id'].toInt(),
        model['title'],
        model['note'],
        convertTime(hour,minutes),
        const NotificationDetails(
           android:AndroidNotificationDetails(
               'your channel 13',
               'your channel name',
              playSound: true,
              importance: Importance.high,
              priority: Priority.max,
              channelDescription: 'your channel description')),
             uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
             androidAllowWhileIdle: true,
             matchDateTimeComponents: DateTimeComponents.time,
             payload: "${model['title']}|"+"${model['note']}|"
    );
  }
  Future<void> configureLocalTimezone()async{
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }
  tz.TZDateTime  convertTime(int hour,int minutes ){
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local,now.year,now.month,now.day,hour,minutes);
    if(scheduleDate.isBefore(now)){
      scheduleDate=scheduleDate;
    }
    return scheduleDate.add(const Duration(days: 1));

  }
}