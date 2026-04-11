import 'package:dio/dio.dart';
import 'package:donor_app/core/networking/api_constants.dart';
import 'package:donor_app/core/networking/api_response.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/core/networking/api_error_handler.dart';
import '../../domain/params/register_params.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<ApiResult<ApiResponse<UserModel>>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );
      final user = ApiResponse<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );
      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ApiResponse<void>>> register(RegisterParams params) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: params.toJson(),
      );
      final data = ApiResponse.fromJson(response.data, (json) => null);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ApiResponse<void>>> verifyOtp(
    String email,
    String otp,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.verifyOtp,
        data: {'email': email, 'otp': otp},
      );
      final data = ApiResponse.fromJson(response.data, (json) => null);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ApiResponse<void>>> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        ApiConstants.sendOtp,
        data: {'email': email},
      );
      final data = ApiResponse.fromJson(response.data, (json) => null);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> resetPassword(String newPassword) async {
    try {
      await _dio.post(
        ApiConstants.resetPassword,
        data: {'new_password': newPassword},
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
