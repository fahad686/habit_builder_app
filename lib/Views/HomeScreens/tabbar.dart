import 'package:flutter/material.dart';
import 'package:monumental_habits/Views/HomeScreens/home_screen.dart';
import 'package:monumental_habits/Views/HomeScreens/new_habit_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BcHome extends StatefulWidget {
  const BcHome({super.key});

  @override
  State<BcHome> createState() => _BcHomeState();
}

class _BcHomeState extends State<BcHome> {
  final PageController _pageController = PageController();

  bool _isChecked = false; // Track FAB icon state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: [
          Home_Page(),
          Screen2(),
          NewHabit_Screen(),
          Screen4(),
          Screen5(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        height: 8.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _pageController.jumpToPage(0);
                setState(() {});
              },
              child: Container(
                child: Image(
                  image: AssetImage("images/homeicon.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _pageController.jumpToPage(1);
                setState(() {});
              },
              child: Container(
                child: Image(
                  image: AssetImage("images/clockicon.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 48), // Space for FAB
            InkWell(
              onTap: () {
                _pageController.jumpToPage(3);
                setState(() {});
              },
              child: Container(
                child: Image(
                  image: AssetImage("images/groupicon.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _pageController.jumpToPage(4);
                setState(() {});
              },
              child: Container(
                child: Image(
                  image: AssetImage("images/settingicon.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 7.h,
        width: 15.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.w,
            color: const Color.fromARGB(221, 127, 60, 60),
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isChecked = !_isChecked; // Toggle the icon
              _pageController.jumpToPage(2);
            });
          },
          child: Icon(
            _isChecked ? Icons.check : Icons.add, // Change icon based on state
            size: 25.sp,
          ),
          backgroundColor: const Color.fromARGB(255, 253, 167, 88),
          elevation: 8.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Example screens

class HomeScreenBc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen 2',
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen 3',
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen 4',
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen 5',
        style: TextStyle(color: Colors.black, fontSize: 24.sp),
      ),
    );
  }
}
