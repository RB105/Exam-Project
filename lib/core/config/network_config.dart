abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkExceptionResponse extends NetworkResponse {
  final String exception;
  NetworkExceptionResponse({required this.exception});
}

class NetworkSuccessResponse<T> extends NetworkResponse {
  T model;
  NetworkSuccessResponse({required this.model});
}
