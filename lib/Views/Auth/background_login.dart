import 'package:flutter/material.dart';
import 'package:monumental_habits/Views/Auth/loginscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackgroundScreen extends StatefulWidget {
  const BackgroundScreen({super.key});

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Container(
              height: 80.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logbc.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 60.h,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              height: 100.h,
              width: 100.w,
              child: Login_Screen(),
            )
          ],
        ),
      ),
    );
  }
}
