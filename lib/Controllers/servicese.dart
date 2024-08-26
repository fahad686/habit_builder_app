import 'package:dio/dio.dart';

class Servicese {
  /// login controller
  Future signIn() async {
    var dio = Dio();
    try {
      var response = await dio.post(
        "https://abusetracker-production.up.railway.app/api/v1/login/",
        data: {"email": "user@email.com", "password": "123456"},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      print(response.data);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
