import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hura_test/app/data/model/user.dart';
import 'package:hura_test/app/data/model/user_response.dart';
import 'package:hura_test/core/model/api_response.dart';
import 'package:hura_test/core/server/api_route.dart';
import 'package:hura_test/core/server/dio_services.dart';
import 'package:hura_test/core/server/error_handler.dart';

class UserProvider {
  final _dio = Get.find<DioServices>();

  Future<Either<ApiResponse, bool>> createUser(
    Map<String, dynamic> map,
  ) async {
    try {
      final response = await _dio.postMethod(map, ApiRoute.createUser);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        // Handle non-200 status codes (e.g., 400, 401, etc.)
        return Left(
            ErrorHandler.httpErrorHandle(statusCode: response.statusCode));
      }
    } on DioException catch (e) {
      // Handle DioException specifically
      if (e.response != null) {
        // If the exception has a response, handle it
        return Left(ErrorHandler.httpErrorHandle(
            errMessage: e.response!.data['message']));
      } else {
        // Handle cases where there's no response

        return Left(ErrorHandler.noConnectionResponse);
      }
    }
  }

  Future<Either<ApiResponse, List<User>>> getUsers(
    Map<String, dynamic> map,
  ) async {
    try {
      final response = await _dio.getMethod(map, ApiRoute.createUser);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = UserResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        return Right(data.data);
      } else {
        // Handle non-200 status codes
        return Left(
            ErrorHandler.httpErrorHandle(statusCode: response.statusCode));
      }
    } on DioException catch (e) {
      // Handle DioException specifically
      if (e.response != null) {
        // If the exception has a response, handle it
        return Left(ErrorHandler.httpErrorHandle(
            errMessage: e.response!.data['message']));
      } else {
        // Handle cases where there's no response

        return Left(ErrorHandler.noConnectionResponse);
      }
    }
  }
}
