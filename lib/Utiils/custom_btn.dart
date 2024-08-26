import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonColor = const Color.fromARGB(255, 253, 167, 88),
    this.textColor = const Color.fromARGB(255, 53, 2, 2), // Set default value
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 7.h,
          width: 88.w,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [],
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: textColor,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
