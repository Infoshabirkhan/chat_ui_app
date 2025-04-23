import 'package:demo_app/View/screens/chat_screen/chat_screen.dart';
import 'package:demo_app/data/utils/my_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MyProviders.initialize(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,


              theme: ThemeData(

                fontFamily: 'cairo',
                scaffoldBackgroundColor: Color(0xfff7f7f7),
              ),
              // home:  const BottomNavigationScreen(),
              home: ChatScreen(),
              // localizationsDelegates: [
              //
              // ],
            ),
      ),
    );
  }
}

