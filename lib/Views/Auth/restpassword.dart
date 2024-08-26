import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monumental_habits/Utiils/custom_btn.dart';
import 'package:monumental_habits/Utiils/custom_txtfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RestPassword_Screen extends StatefulWidget {
  const RestPassword_Screen({super.key});

  @override
  State<RestPassword_Screen> createState() => _RestPassword_ScreenState();
}

class _RestPassword_ScreenState extends State<RestPassword_Screen> {
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: const Color.fromARGB(255, 255, 243, 233),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 164, 160, 164),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 70.w,
              child: Text(
                'FORGOT YOUR PASSWORD ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 53, 2, 2),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 24.h,
              width: 80.w,
              child: Image(
                filterQuality: FilterQuality.high,
                image: AssetImage("images/forgotbc.png"),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 26.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 62.w,
                    child: Text(
                      'Enter your registered email below to recive password rest instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 53, 2, 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTxtfield(
                    controller: emailController,
                    icon: Icon(
                      Icons.email_outlined,
                      color: const Color.fromARGB(255, 244, 161, 85),
                    ),
                    hintText: "Useremail",
                    inputType: TextInputType.emailAddress,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: "Send Rest Link",
                    isLoading: _isLoading,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Remember Password?"),
                SizedBox(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Sign in",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
