


// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/local_data/cache_helper.dart';
import 'package:untitled/ui/widgets/home_page.dart';

import 'componnents/style/theme.dart';
import 'ui/app_main_cubit/cubit.dart';
import 'ui/app_main_cubit/state.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark')??false;
  runApp( MyApp(
    isDark: isDark,
  ));
}
class MyApp extends StatelessWidget {

  MyApp({required this.isDark});
  final bool isDark;
  static final navigatorKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context)=>AppCubit()..changeAppMode(fromShared:isDark)..createdatabase()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:AppCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: HomePage(),
            navigatorKey: navigatorKey,
          );
        },
      ),
    );
  }
}