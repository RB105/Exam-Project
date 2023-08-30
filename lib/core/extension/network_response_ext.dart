import 'package:exam_project/core/config/network_config.dart';

extension TypeNetworkResponse<T> on NetworkResponse {
  T get model => (this as NetworkSuccessResponse).model;
  String get exception => (this as NetworkExceptionResponse).exception;

  bool get isException => this is NetworkExceptionResponse ? true : false;
  bool get isSuccess => this is NetworkSuccessResponse ? true : false;
}
