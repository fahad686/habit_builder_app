import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monumental_habits/Utiils/custom_container.dart';
import 'package:monumental_habits/Utiils/custom_txtfield.dart';
import 'package:monumental_habits/Views/HomeScreens/getbottomsheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class New_Habit extends StatefulWidget {
  const New_Habit({super.key});

  @override
  State<New_Habit> createState() => _New_HabitState();
}

class _New_HabitState extends State<New_Habit> {
  TextEditingController nameController = TextEditingController();
  bool _notificationEnabled = false;
  List<bool> notificationStatus = List.generate(12, (_) => false);
  List<String> notificationTimes = List.generate(12, (_) => '10:30 AM');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w),
      height: 100.h,
      width: 100.w,
      //color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTxtfield(
                cardColor: Colors.white,
                width: 70.w,
                controller: nameController,
                hintText: "UserName",
                inputType: TextInputType.text,
                isPassword: false,
              ),
              Badge(
                backgroundColor: const Color.fromARGB(255, 252, 157, 69),
                label: Icon(Icons.add, size: 14.sp, color: Colors.white),
                child: CircleAvatar(
                  child: Icon(Icons.local_library,
                      size: 28.sp,
                      color: const Color.fromARGB(255, 87, 51, 83)),
                  radius: 20.sp,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 17.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.h,
                      width: 48.w,
                      child: Center(
                          child: Text(
                        "Habit Frequency",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 87, 51, 83),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                    ),
                    Container(
                      height: 5.h,
                      width: 30.w,
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              "Custom",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 252, 157, 69),
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 24.sp,
                            color: Color.fromRGBO(241, 131, 63, 0.733),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SUN",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 1.0),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "MON",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 0.5),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "TUE",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 0.5),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WED",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 1.0),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "THU",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 0.5),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "FIR",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 1.0),

                          ///
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SAT",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 87, 51, 83),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomContainer(opacity: 1.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 5.h,
                  width: 32.w,
                  child: Center(
                      child: Text(
                    "Reminder",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 87, 51, 83),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
                Container(
                  height: 5.h,
                  width: 30.w,
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          "10:00 AM",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 252, 157, 69),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24.sp,
                        color: Color.fromRGBO(241, 131, 63, 0.733),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 5.h,
                  width: 32.w,
                  child: Center(
                      child: Text(
                    "Notification",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 87, 51, 83),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
                Container(
                  height: 5.h,
                  width: 30.w,
                  child: Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      value: _notificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _notificationEnabled = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 100.w,
            child: Stack(
              children: [
                Positioned(
                  top: 13.h,
                  child: Container(
                    height: 22.h,
                    width: 92.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          "START THIS HABIT",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: Color.fromARGB(255, 49, 1, 18),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "we lead to our improvements and progress",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 49, 1, 18),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "we lead to our nation",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 49, 1, 18),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(GetBottomSheet());
                          },
                          child: Icon(
                            Icons.play_for_work,
                            size: 32.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 30.w,
                  child: Container(
                    height: 11.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/profile.jpeg"),
                            fit: BoxFit.fill),
                        color: Colors.transparent,
                        shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
