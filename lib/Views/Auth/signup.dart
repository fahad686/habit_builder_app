import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monumental_habits/Utiils/custom_btn.dart';
import 'package:monumental_habits/Utiils/custom_txtfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: const Color.fromARGB(255, 255, 243, 233),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 24.h,
                width: 80.w,
                child: Image(
                  filterQuality: FilterQuality.high,
                  image: AssetImage("images/signupbc.png"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 70.w,
                child: Text(
                  'CREATE YOUR ACCOUNT',
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
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CustomTxtfield(
                      controller: nameController,
                      icon: Icon(
                        Icons.person_outline,
                        color: const Color.fromARGB(255, 244, 161, 85),
                      ),
                      hintText: "UserName",
                      inputType: TextInputType.text,
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 1.h,
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
                    CustomTxtfield(
                      controller: passwordController,
                      icon: Icon(
                        Icons.lock_outline,
                        color: const Color.fromARGB(255, 244, 161, 85),
                      ),
                      hintText: "Password",
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 253, 167, 88),
                    checkColor: const Color.fromARGB(255, 53, 2, 2),
                    value: _isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                    },
                  ),
                  Text(
                    'Keep me signed in',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 253, 167, 88),
                    checkColor: const Color.fromARGB(255, 53, 2, 2),
                    value: _isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked2 = value!;
                      });
                    },
                  ),
                  Text(
                    'email me about spicial',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 23.w),
                ],
              ),
              CustomButton(
                onPressed: () {},
                text: "Create Account",
                isLoading: _isLoading,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 30,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Sign in with",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 10,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
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
                          "Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 6.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
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
                          "Facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
