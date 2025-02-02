import 'package:hura_test/core/model/api_response.dart';

class ErrorHandler {
  static const int noConnection = -1;
  static const String noConnectionMessage = 'No internet connection';

  static ApiResponse noConnectionResponse = ApiResponse(
    message: noConnectionMessage,
    statusCode: noConnection,
  );

  static ApiResponse httpErrorHandle({
    required int statusCode,
  }) {
    String errorMessage;

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

    return ApiResponse(
      message: errorMessage,
      statusCode: statusCode,
    );
  }
}
