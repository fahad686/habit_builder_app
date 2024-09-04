import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:monumental_habits/Views/Auth/splash_screen.dart';
import 'package:monumental_habits/Views/HomeScreens/calendar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark(), // yeh default theme hai
        darkTheme: ThemeData.dark(), // yeh dark theme hai
        themeMode: ThemeMode.system, // yeh theme mode hai
        home: CalendarView(),
        //Splash_Screen(),
      );
    });
  }
}
