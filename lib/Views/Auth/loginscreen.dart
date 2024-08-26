import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monumental_habits/Controllers/servicese.dart';
import 'package:monumental_habits/Utiils/custom_btn.dart';
import 'package:monumental_habits/Utiils/custom_txtfield.dart';
import 'package:monumental_habits/Views/Auth/restpassword.dart';
import 'package:monumental_habits/Views/Auth/signup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool _isLoading = false;
  LogInController loginController = Get.put(LogInController());
  // var isLogin = false.obs;

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      // color: Colors.lightBlue,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  height: 10.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 209, 228),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.question_mark),
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              width: 70.w,
              child: Text(
                'WELCOME TO MONUMENTAL HABITS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 53, 2, 2),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 6.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), color: Colors.white),
              child: Row(
                children: [
                  SizedBox(
                    width: 05.w,
                  ),
                  Center(
                    child: Container(
                      height: 3.h,
                      width: 10.w,
                      child: Image(
                        image: AssetImage("images/google.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Continue with Google",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 6.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), color: Colors.white),
              child: Row(
                children: [
                  SizedBox(
                    width: 05.w,
                  ),
                  Center(
                    child: Container(
                      height: 3.h,
                      width: 10.w,
                      child: Image(
                        image: AssetImage("images/facebook.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Continue with Facebook",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text("Login with Email"),
            Divider(
              indent: 10.w,
              endIndent: 10.w,
            ),
            CustomTxtfield(
              controller: loginController.emailController,
              icon: Icon(
                Icons.email_outlined,
                color: const Color.fromARGB(255, 244, 161, 85),
              ),
              hintText: "Useremail",
              inputType: TextInputType.text,
              isPassword: false,
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomTxtfield(
              controller: loginController.passwordController,
              icon: Icon(
                Icons.lock_outline,
                color: const Color.fromARGB(255, 244, 161, 85),
              ),
              hintText: "Password",
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await loginController.signinWithEmail();
                setState(() {
                  _isLoading = false;
                });
              },
              text: "LogIn",
              isLoading: _isLoading,
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
                onTap: () {
                  Get.to(RestPassword_Screen());
                },
                child: Text("Forgot Password?")),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have account?"),
                InkWell(
                  onTap: () {
                    Get.to(Signup_Screen());
                  },
                  child: Text(
                    "Sign up",
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
