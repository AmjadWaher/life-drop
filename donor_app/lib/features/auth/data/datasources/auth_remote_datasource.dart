import 'package:dio/dio.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/core/networking/api_error_handler.dart';
import '../../domain/params/register_params.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<ApiResult<UserModel>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      final user = UserModel.fromJson(response.data['user']);
      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserModel>> register(RegisterParams params) async {
    try {
      final response = await _dio.post('/auth/register', data: params.toJson());
      final user = UserModel.fromJson(response.data['user']);
      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> verifyOtpForRegister(String email, String otp) async {
    try {
      await _dio.post(
        '/auth/verify-register-otp',
        data: {'email': email, 'otp': otp},
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> sendOtpForForgotPassword(String email) async {
    try {
      await _dio.post('/auth/forgot-password/send-otp', data: {'email': email});
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> verifyOtpForForgotPassword(
    String email,
    String otp,
  ) async {
    try {
      await _dio.post(
        '/auth/forgot-password/verify-otp',
        data: {'email': email, 'otp': otp},
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      await _dio.post(
        '/auth/forgot-password/reset',
        data: {'email': email, 'password': newPassword},
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
