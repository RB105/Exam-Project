import 'package:dio/dio.dart';

mixin DioConfigration {
  Dio createRequest() {
    Dio dio = Dio(BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(milliseconds: 5 * 1000),
        sendTimeout: const Duration(milliseconds: 5 * 1000),
        receiveTimeout: const Duration(milliseconds: 5 * 1000)));

    return dio;
  }

  String catchError(DioException e) {
    if (e.response?.statusCode != null &&
        e.response!.statusCode! >= 300 &&
        e.response!.statusCode! <= 599) {
      return e.message.toString();
    } else {
      switch (e.type) {
        case DioExceptionType.unknown:
          return "No internet connection";
        default:
          return "Something went wrong";
      }
    }
  }
}
