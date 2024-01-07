
/// Manage response when send request to API [RB]
abstract class NetworkResponse {
  NetworkResponse();
}

/// When get error data from API [RB]
class NetworkExceptionResponse extends NetworkResponse {
  /// error message transmisson [RB]
  final String exception;
  NetworkExceptionResponse({required this.exception});
}

/// When get success response from API [RB]
class NetworkSuccessResponse<T> extends NetworkResponse {
  /// flexible data transmisson [RB]
  T model;
  NetworkSuccessResponse({required this.model});
}
