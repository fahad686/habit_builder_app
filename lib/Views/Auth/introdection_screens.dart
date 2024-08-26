import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monumental_habits/Views/Auth/background_login.dart'; // Ensure this import is correct
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Introdection_Screen extends StatefulWidget {
  @override
  _Introdection_ScreenState createState() => _Introdection_ScreenState();
}

class _Introdection_ScreenState extends State<Introdection_Screen> {
  int _currentPage = 0;
  final CarouselController _carouselController = CarouselController();

  final List<Map<String, String>> _slides = [
    {"image": "images/bc1.png"},
    {"image": "images/bc2.png"},
    {"image": "images/bc3.png"},
    {"image": "images/bc4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              width: 90.w,
              color: Colors.white,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _slides.length,
                options: CarouselOptions(
                  height: 75.h,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  enableInfiniteScroll: false,
                  scrollPhysics: _currentPage == _slides.length - 1
                      ? NeverScrollableScrollPhysics() // Disable scroll on the last slide
                      : null,
                ),
                itemBuilder: (context, index, realIdx) {
                  return _buildPage(image: _slides[index]["image"]!);
                },
              ),
            ),
            _buildBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String image}) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high, // Improved image quality
        ),
      ),
    );
  }

  Widget _buildBottomContainer() {
    if (_currentPage == _slides.length - 1) {
      // Last slide, show "Get Started" button and disable back navigation
      return Container(
        height: 10.h,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => BackgroundScreen()); // Use a widget function
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 244, 161, 85),
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 2.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
            ),
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color.fromARGB(255, 53, 2, 2),
              ),
            ),
          ),
        ),
      );
    } else {
      // Show "Previous" and "Next" buttons
      return Container(
        color: Colors.white,
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button
            TextButton(
              onPressed: () {
                if (_currentPage < _slides.length - 1) {
                  _carouselController.jumpToPage(_slides.length - 1);
                } else {
                  Get.offAll(() => BackgroundScreen()); // Use a widget function
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade600,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: const Color.fromARGB(255, 53, 2, 2),
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp),
              ),
            ),

            // Indicator Dots (Center)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: _currentPage == index ? 1.5.h : 1.h,
                  height: _currentPage == index ? 1.5.h : 1.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.orange
                        : Colors.grey.shade400,
                    border: _currentPage == index
                        ? Border.all(color: Colors.white, width: 2)
                        : null,
                  ),
                );
              }),
            ),

            // Next Button
            TextButton(
              onPressed: _currentPage < _slides.length - 1
                  ? () {
                      _carouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade600,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                    color: const Color.fromARGB(255, 53, 2, 2),
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp),
              ),
            ),
          ],
        ),
      );
    }
  }
}
