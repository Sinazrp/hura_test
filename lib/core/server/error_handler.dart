import 'package:hura_test/core/model/api_response.dart';

class ErrorHandler {
  static const int noConnection = -1;
  static const String noConnectionMessage = 'No internet connection';

  static ApiResponse noConnectionResponse = ApiResponse(
    message: noConnectionMessage,
    statusCode: noConnection,
  );

  static ApiResponse httpErrorHandle({
    int? statusCode,
    String? errMessage,
  }) {
    String errorMessage;
    if (errMessage == null) {
      switch (statusCode) {
        case 400:
          errorMessage = 'Bad Request';
          break;

        case 500:
          errorMessage = 'Internal Server Error';
          break;

        case 404:
          errorMessage = 'Not Found';
          break;

        case 408:
          errorMessage = 'Request Timeout';
          break;

        default:
          errorMessage = 'An unexpected error occurred';
          break;
      }
    } else {
      errorMessage = errMessage;
    }

    return ApiResponse(
      message: errorMessage,
      statusCode: statusCode ?? 0,
    );
  }
}
