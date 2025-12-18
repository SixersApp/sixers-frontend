import 'package:dio/dio.dart';

String handleDioException(DioException e) {
  return e.message ?? "Our server is not working currently";
}