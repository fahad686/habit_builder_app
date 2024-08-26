import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:monumental_habits/Views/HomeScreens/tabbar.dart'; // Import Dio

class LogInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Initialize Dio instance
  final Dio dio = Dio();

  Future<void> signinWithEmail() async {
    try {
      final response = await dio.post(
        "https://abusetracker-production.up.railway.app/api/v1/login/",
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        print(data["message"]);

        Get.snackbar(
          data["message"] ?? "Success",
          "Result",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        );
        emailController.clear();
        passwordController.clear();
        Get.to(() => BcHome());
      } else {
        // Handle error response
        final error = response.data as Map<String, dynamic>;
        Get.snackbar(
          error["message"] ?? "Error",
          "Result",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        );
        print("Failed");
      }
    } catch (e) {
      // Handle DioError separately for better error handling
      if (e is DioException) {
        final errorMessage = e.response?.data["message"] ?? "An error occurred";
        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        );
        print("DioError: ${e.response?.data}");
      } else {
        // Handle other exceptions
        Get.snackbar(
          "An error occurred",
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        );
        print("Exception: $e");
      }
    }
  }
}
