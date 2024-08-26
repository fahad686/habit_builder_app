import 'package:flutter/material.dart';
import 'package:monumental_habits/Views/HomeScreens/newhabit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewHabit_Screen extends StatefulWidget {
  const NewHabit_Screen({super.key});

  @override
  State<NewHabit_Screen> createState() => _NewHabit_ScreenState();
}

class _NewHabit_ScreenState extends State<NewHabit_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h), // Set the height of the AppBar
        child: AppBar(
          foregroundColor: Color.fromARGB(255, 42, 13, 157),
          backgroundColor: Color.fromARGB(255, 255, 243, 233),
          title: Text(
            "New Habit",
            style: TextStyle(
              fontSize: 19.sp,
              color: Color.fromARGB(255, 49, 1, 18),
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.all(8.0), // Adjust margin as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 20.sp,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            // Background Layer
            Container(
              height: 100.h,
              width: 100.w,
              color: const Color.fromARGB(255, 255, 243, 233),
            ),
            Positioned(
              top: 32.h,
              child: Container(
                height: 46.h,
                width: 100.w,
                color: const Color.fromARGB(255, 255, 243, 233),
                child: Image(
                  image: AssetImage("images/homebc.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
////////main screen code
            Container(
              child: New_Habit(),
            )
          ],
        ),
      ),
    );
  }
}
