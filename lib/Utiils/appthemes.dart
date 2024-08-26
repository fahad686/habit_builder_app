import 'package:flutter/material.dart';

class AppThemes {
  // Define common colors used across the app
  static const Color topColor = Color.fromARGB(255, 47, 136, 183);
  static const Color bottomColor = Color.fromARGB(255, 47, 136, 183);
  static const Color buttonColor = Color.fromARGB(255, 5, 23, 41);
  static const Color dividerColor = Colors.white;

  // Define the gradient used in multiple screens
  static const LinearGradient appGradient = LinearGradient(
    colors: [topColor, bottomColor],
    stops: [0.3, 0.7],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
