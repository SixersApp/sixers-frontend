import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://r8bg7l0ij9.execute-api.us-west-2.amazonaws.com/Prod",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static void setAuthToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }
}