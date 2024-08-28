import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monumental_habits/Utiils/custom_btn.dart';
import 'package:monumental_habits/Utiils/custom_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedMonth = DateTime.now(); // Track the selected month
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // Last day of the selected month
    DateTime lastDayOfMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0);

    // List of all dates in the selected month
    List<DateTime> monthDates = List.generate(
      lastDayOfMonth.day,
      (index) => DateTime(_selectedMonth.year, _selectedMonth.month, index + 1),
    );

    // Calculate dates to display from the previous month
    DateTime firstDayOfMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    int leadingEmptyDays = firstDayOfMonth.weekday % 7;
    List<DateTime> previousMonthDates = List.generate(
      leadingEmptyDays,
      (index) =>
          firstDayOfMonth.subtract(Duration(days: leadingEmptyDays - index)),
    );

    // Calculate dates to display from the next month
    int trailingEmptyDays = (6 - lastDayOfMonth.weekday % 7) % 7;
    List<DateTime> nextMonthDates = List.generate(
      trailingEmptyDays,
      (index) => lastDayOfMonth.add(Duration(days: index + 1)),
    );

    // Combine all dates to show in the calendar grid
    List<DateTime> allDatesToDisplay = [
      ...previousMonthDates,
      ...monthDates,
      ...nextMonthDates
    ];

    List<String> dayNames = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h), // Set the height of the AppBar
        child: AppBar(
          foregroundColor: const Color.fromARGB(255, 42, 13, 157),
          backgroundColor: const Color.fromARGB(255, 255, 243, 233),
          title: Text(
            "Read-a-Book",
            style: TextStyle(
              fontSize: 19.sp,
              color: const Color.fromARGB(255, 49, 1, 18),
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.all(8.0), // Adjust margin as needed
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
          actions: [
            Container(
              margin: const EdgeInsets.all(8.0), // Adjust margin as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20.sp,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: const Color.fromARGB(255, 255, 243, 233),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 10.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 1.h,
                            left: 5.w,
                            child: Container(
                              height: 8.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Image(
                                image: AssetImage("images/homeicon.png"),
                                //fit: BoxFit.fill,
                              ),
                            )),
                        Positioned(
                          top: 1.h,
                          left: 26.w,
                          child: Text(
                            "Read a Book",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 4.h,
                            left: 24.w,
                            child: Icon(
                              Icons.notifications_outlined,
                              size: 19.sp,
                              color: const Color.fromARGB(255, 252, 157, 69),
                            )),
                        Positioned(
                          top: 4.5.h,
                          left: 30.w,
                          child: Text(
                            "Repeat Everyday",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 7.h,
                            left: 24.w,
                            child: Icon(
                              Icons.repeat_outlined,
                              size: 18.sp,
                              color: const Color.fromARGB(255, 252, 157, 69),
                            )),
                        Positioned(
                          top: 7.h,
                          left: 30.w,
                          child: Text(
                            "Reminder 5:00 am",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                // Move to the previous month
                                _selectedMonth = DateTime(_selectedMonth.year,
                                    _selectedMonth.month - 1);
                              });
                            },
                          ),
                          Text(
                            DateFormat('MMMM : yyyy').format(_selectedMonth),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 87, 51, 83),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              setState(() {
                                // Move to the next month
                                _selectedMonth = DateTime(_selectedMonth.year,
                                    _selectedMonth.month + 1);
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: dayNames
                            .map(
                              (day) => Expanded(
                                child: Center(
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromARGB(255, 87, 51, 83),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: allDatesToDisplay.length,
                    itemBuilder: (context, index) {
                      DateTime date = allDatesToDisplay[index];
                      String dayNumber = DateFormat('d').format(date);
                      bool isToday = DateUtils.isSameDay(date, DateTime.now());
                      bool isCurrentMonth = date.month == _selectedMonth.month;

                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isCurrentMonth
                                ? const Color.fromARGB(255, 255, 243, 233)
                                : const Color.fromARGB(255, 201, 223, 244),
                            borderRadius: BorderRadius.circular(10),
                            border: isToday
                                ? Border.all(
                                    color:
                                        const Color.fromARGB(255, 35, 38, 214),
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayNumber,
                                style: TextStyle(
                                  color: isCurrentMonth
                                      ? const Color.fromARGB(255, 60, 6, 6)
                                      : const Color.fromARGB(
                                          255, 100, 100, 100),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 0.2.h),
                              isCurrentMonth
                                  ? Container(
                                      height: 4.4.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 230, 193, 163),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:
                                          const CustomContainer(opacity: 0.5),
                                    )
                                  : Container(
                                      height: 4.4.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 230, 193, 163),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ), // Empty container for non-current month dates
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Analytics",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 24.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 11.h,
                        left: 0,
                        right: 0,
                        child: const Divider(
                          thickness: 2,
                          color: const Color.fromARGB(255, 230, 193, 163),
                        ),
                      ),
                      Positioned(
                        left: 45.w,
                        top: 0,
                        bottom: 0,
                        child: const VerticalDivider(
                          thickness: 2,
                          color: const Color.fromARGB(255, 230, 193, 163),
                        ),
                      ),
                      //1st
                      Positioned(
                        top: 2.3.h,
                        left: 5.w,
                        child: Text(
                          "20 DAYS",
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: Text(
                          "Longest Streak",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3.h,
                        left: 32.w,
                        child: Container(
                          height: 5.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 249, 234, 223),
                              shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.flame_fill,
                            color: Color.fromARGB(255, 214, 144, 94),
                            size: 30.0,
                          ),
                        ),
                      ),

                      ///2nd
                      Positioned(
                        top: 2.3.h,
                        left: 52.w,
                        child: Text(
                          "0 DAYS",
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.h,
                        left: 52.w,
                        child: Text(
                          "Current Streak",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3.h,
                        left: 78.w,
                        child: Container(
                          height: 5.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 172, 158),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.flash_on,
                            color: const Color.fromARGB(255, 243, 33, 33),
                            size: 30.0,
                          ),
                        ),
                      ),

                      ///3rd
                      Positioned(
                        top: 14.h,
                        left: 5.w,
                        child: Text(
                          "20 DAYS",
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18.h,
                        left: 5.w,
                        child: Text(
                          "Longest Street",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15.h,
                        left: 32.w,
                        child: Container(
                          height: 5.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 167, 212, 249),
                              shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.chart_bar_alt_fill,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ),
                      ),
                      //4th
                      Positioned(
                        top: 14.h,
                        left: 52.w,
                        child: Text(
                          "20 DAYS",
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18.h,
                        left: 52.w,
                        child: Text(
                          "Longest Street",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color.fromARGB(255, 61, 2, 2),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 15.h,
                          left: 78.w,
                          child: Container(
                            height: 5.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 186, 77, 52),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.eco,
                              color: Color.fromARGB(255, 61, 2, 2),
                              size: 30.0,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                    text: "Mark Habit as Complete",
                    onPressed: () {},
                    isLoading: _isLoading),
                CustomButton(
                    buttonColor: Colors.white,
                    text: "Mark Habit as Missed",
                    onPressed: () {},
                    isLoading: _isLoading),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
