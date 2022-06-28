import 'package:flutter/material.dart';
import 'package:untitled/componnents/styles/theme.dart';
import 'package:untitled/shared/local_data/cache_helper.dart';
import 'package:untitled/ui/demo_login_screen.dart';
import 'package:untitled/ui/on_boarding_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')??false;
  if(onBoarding==true){
    widget = DemoLoginScreen();
  }else{
    widget =OnBoardingScreen();
  }
  // if(onBoarding != null){
  // }if(onBoarding == null){
  //   widget =OnBoardingScreen();
  // }
  // else{
  // widget =OnBoardingScreen();
  // }
  runApp( MyApp(
    startwidget: widget,
  ));
}
class MyApp extends StatelessWidget {
  MyApp({required this.startwidget});
  final Widget startwidget;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:lightTheme,
      themeMode: ThemeMode.light,
      home: startwidget,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
