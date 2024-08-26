import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monumental_habits/Utiils/custom_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    List<DateTime> monthDates = List.generate(
      lastDayOfMonth.day,
      (index) => DateTime(now.year, now.month, index + 1),
    );
    return Container(
      height: 100.h,
      width: 100.w,
      color: const Color.fromARGB(0, 168, 86, 86),
      child: Column(
        children: [
          SizedBox(height: 3.h),
          Container(
            height: 18.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 56.w,
                  top: 1.h,
                  child: Container(
                    height: 16.h,
                    width: 40.w,
                    child: Image(
                      image: AssetImage("images/bc5.png"),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  left: 6.w,
                  child: Text(
                    "WE MAKE FIRST OUR HABITS,",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 49, 1, 18),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  left: 6.w,
                  child: Text(
                    "AND THEN OUR HABITS",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 49, 1, 18),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 6.w,
                  child: Text(
                    "MAKES US",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 49, 1, 18),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 9.w,
                  child: Text(
                    "-ANONYMOUS",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color.fromARGB(255, 49, 1, 18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  child: Center(
                    child: Text(
                      "HABITS",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Container(
                    height: 6.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: monthDates.length,
                      itemBuilder: (context, index) {
                        DateTime date = monthDates[index];
                        String dayName =
                            DateFormat('EEE').format(date); // e.g., SUN
                        String dayNumber =
                            DateFormat('d').format(date); // e.g., 17
                        bool isToday = DateUtils.isSameDay(date, now);

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Container(
                            height: 7.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: isToday
                                  ? Border.all(
                                      color: Color.fromARGB(255, 35, 38, 214),
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dayName.toUpperCase(),
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 87, 51, 83),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  dayNumber,
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 87, 51, 83),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 7.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Read A Book",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Container(
                    height: 6.h,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 0.5),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 0.5),
                        CustomContainer(opacity: 1.0),
                        CustomContainer(opacity: 0.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 7.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Exercies",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Container(
                    height: 6.h,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 246, 91, 78),
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 246, 91, 78),
                        ),
                        CustomContainer(
                          opacity: 0.5,
                          color: const Color.fromARGB(255, 246, 91, 78),
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 246, 91, 78),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 7.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Wake Up Early",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Container(
                    height: 6.h,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 41, 49, 159),
                        ),
                        CustomContainer(
                          opacity: 0.5,
                          color: const Color.fromARGB(255, 41, 49, 159),
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 41, 49, 159),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 7.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Walk Dog",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Container(
                    height: 6.h,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 151, 52, 86),
                        ),
                        CustomContainer(
                          opacity: 0.5,
                          color: const Color.fromARGB(255, 151, 52, 86),
                        ),
                        CustomContainer(
                          opacity: 1.0,
                          color: const Color.fromARGB(255, 151, 52, 86),
                        ),
                        CustomContainer(
                          opacity: 0.5,
                          color: const Color.fromARGB(255, 151, 52, 86),
                        ),
                      ],
                    ),
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
