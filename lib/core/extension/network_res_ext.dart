import 'package:exam_project/core/config/network_config.dart';

extension TypeNetworkResponse<T> on NetworkResponse {
  T get model => (this as NetworkSuccessResponse).model;
  String get exception => (this as NetworkExceptionResponse).exception;

  bool isException() {
    if (this is NetworkExceptionResponse) {
      return true;
    } else {
      return false;
    }
  }

  bool isSuccess() {
    if (this is NetworkSuccessResponse) {
      return true;
    } else {
      return false;
    }
  }
}
