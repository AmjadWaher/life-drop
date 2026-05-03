import 'package:dio/dio.dart';
import 'package:donor_app/core/networking/api_constants.dart';
import 'package:donor_app/core/networking/api_response.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/core/networking/api_error_handler.dart';
import 'package:donor_app/features/auth/data/models/districts_model.dart';
import 'package:donor_app/features/auth/data/models/governorate_model.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../../domain/params/register_params.dart';
import '../models/login_response_model.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<ApiResult<LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );
      final data = ApiResponse<LoginResponseModel>.fromJson(
        response.data,
        (json) => LoginResponseModel.fromJson(json as Map<String, dynamic>),
      );
      return ApiResult.success(data.data);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      LOGIN API ERROR:
      Endpoint: 'login'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> register(RegisterParams params) async {
    try {
      await _dio.post(ApiConstants.register, data: params.toJson());
      return ApiResult.success(null);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      Register API ERROR:
      Endpoint: 'register'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> verifyOtp(String email, String code) async {
    try {
      await _dio.post(
        ApiConstants.verifyOtp,
        data: {'email': email, 'code': code},
      );
      return ApiResult.success(null);
    } on DioException catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      VerifyOTP API ERROR:
      Endpoint: 'verifyOtp'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      VerifyOTP API ERROR:
      Endpoint: 'verifyOtp'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> verifyRegistration(String email, String code) async {
    try {
      await _dio.post(
        ApiConstants.verifyRegistration,
        data: {'email': email, 'code': code},
      );
      return ApiResult.success(null);
    } on DioException catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      VerifyRegistration API ERROR:
      Endpoint: 'verifyRegistration'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      VerifyRegistration API ERROR:
      Endpoint: 'verifyRegistration'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> sendOtp(String email) async {
    try {
      await _dio.post(ApiConstants.sendOtp, data: {'email': email});
      return ApiResult.success(null);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      SendOTP API ERROR:
      Endpoint: 'sendOtp'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> resendOtp(String email) async {
    try {
      await _dio.post(ApiConstants.resendOtp, data: {'email': email});
      return ApiResult.success(null);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      ResendOTP API ERROR:
      Endpoint: 'resendOtp'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> resendRegistrationOtp(String email) async {
    try {
      await _dio.post(
        ApiConstants.resendRegistrationOtp,
        data: {'email': email},
      );
      return ApiResult.success(null);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      ResendRegistrationOTP API ERROR:
      Endpoint: 'resendRegistrationOtp'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<void>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      await _dio.post(
        ApiConstants.resetPassword,
        data: {'email': email, 'code': code, 'newPassword': newPassword},
      );
      return ApiResult.success(null);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      ResetPassword API ERROR:
      Endpoint: 'resetPassword'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<List<GovernorateModel>>> getGovernorates() async {
    try {
      final response = await _dio.get(ApiConstants.governorates);
      final data = ApiResponse<List<GovernorateModel>>.fromJson(
        response.data,
        (data) => List.from(data as List)
            .map(
              (json) => GovernorateModel.fromJson(json as Map<String, dynamic>),
            )
            .toList(),
      );
      return ApiResult.success(data.data);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      GetGovernorates API ERROR:
      Endpoint: 'getGovernorates'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  Future<ApiResult<List<DistrictsModel>>> getDistrictsByGovernorateId(
    String governorateId,
  ) async {
    try {
      final response = await _dio.get(ApiConstants.districts(governorateId));
      final data = ApiResponse<List<DistrictsModel>>.fromJson(
        response.data,
        (data) => List.from(
          data as List,
        ).map((json) => DistrictsModel.fromJson(json)).toList(),
      );
      return ApiResult.success(data.data);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      GetDistricts API ERROR:
      Endpoint: 'getDistrictsByGovernorateId'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }
}
