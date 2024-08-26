import 'package:flutter/material.dart';
import 'package:monumental_habits/Views/HomeScreens/homescreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h), // Set the height of the AppBar
        child: AppBar(
          foregroundColor: Color.fromARGB(255, 42, 13, 157),
          backgroundColor: Color.fromARGB(255, 255, 243, 233),
          title: Text(
            "Homepage",
            style: TextStyle(
              fontSize: 20.sp,
              color: Color.fromARGB(255, 49, 1, 18),
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.all(8.0), // Adjust margin as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color:
                  Colors.grey[300], // Background color of the round container
            ),
            child: IconButton(
              icon: Icon(
                Icons.drag_handle,
                size: 22.sp, // Adjust the size of the icon
                color: Colors.black, // Color of the icon
              ),
              onPressed: () {
                // Add action for menu button
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpeg'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            // Background Layer
            Container(
              height: 36.h,
              width: 100.w,
              color: const Color.fromARGB(255, 255, 243, 233),
            ),
            Positioned(
              top: 32.h,
              child: Container(
                height: 51.h,
                width: 100.w,
                color: const Color.fromARGB(255, 255, 243, 233),
                child: Image(
                  image: AssetImage("images/homebc.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Positioned(
              left: 5.w,
              child: Container(
                height: 100.h,
                width: 100.w,
                child: HomeScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
