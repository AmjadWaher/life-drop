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

abstract class AuthRemoteDataSource {
  Future<ApiResult<LoginResponseModel>> login(String email, String password);
  Future<ApiResult<void>> register(RegisterParams params);
  Future<ApiResult<void>> verifyOtp(String email, String code);
  Future<ApiResult<void>> verifyRegistration(String email, String code);
  Future<ApiResult<void>> sendOtp(String email);
  Future<ApiResult<void>> resendOtp(String email);
  Future<ApiResult<void>> resendRegistrationOtp(String email);
  Future<ApiResult<void>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  });
  Future<ApiResult<List<GovernorateModel>>> getGovernorates();
  Future<ApiResult<List<DistrictsModel>>> getDistrictsByGovernorateId(
    String governorateId,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  /// Wraps every API call with unified error handling and Crashlytics logging.
  Future<ApiResult<T>> _safeApiCall<T>(
    String endpoint,
    Future<T> Function() apiCall,
  ) async {
    try {
      final result = await apiCall();
      return ApiResult.success(result);
    } catch (e, stack) {
      final error = ApiErrorHandler.handle(e);

      FirebaseCrashlytics.instance.log("""
      $endpoint API ERROR:
      Endpoint: '$endpoint'
      Status: ${error.code}
      Errors: ${error.getAllErrorMessages()}
      """);

      FirebaseCrashlytics.instance.recordError(e, stack);

      return ApiResult.failure(error);
    }
  }

  @override
  Future<ApiResult<LoginResponseModel>> login(String email, String password) {
    return _safeApiCall('login', () async {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );
      final data = ApiResponse<LoginResponseModel>.fromJson(
        response.data,
        (json) => LoginResponseModel.fromJson(json as Map<String, dynamic>),
      );
      return data.data;
    });
  }

  @override
  Future<ApiResult<void>> register(RegisterParams params) {
    return _safeApiCall('register', () async {
      await _dio.post(ApiConstants.register, data: params.toJson());
    });
  }

  @override
  Future<ApiResult<void>> verifyOtp(String email, String code) {
    return _safeApiCall('verifyOtp', () async {
      await _dio.post(
        ApiConstants.verifyOtp,
        data: {'email': email, 'code': code},
      );
    });
  }

  @override
  Future<ApiResult<void>> verifyRegistration(String email, String code) {
    return _safeApiCall('verifyRegistration', () async {
      await _dio.post(
        ApiConstants.verifyRegistration,
        data: {'email': email, 'code': code},
      );
    });
  }

  @override
  Future<ApiResult<void>> sendOtp(String email) {
    return _safeApiCall('sendOtp', () async {
      await _dio.post(ApiConstants.sendOtp, data: {'email': email});
    });
  }

  @override
  Future<ApiResult<void>> resendOtp(String email) {
    return _safeApiCall('resendOtp', () async {
      await _dio.post(ApiConstants.resendOtp, data: {'email': email});
    });
  }

  @override
  Future<ApiResult<void>> resendRegistrationOtp(String email) {
    return _safeApiCall('resendRegistrationOtp', () async {
      await _dio.post(
        ApiConstants.resendRegistrationOtp,
        data: {'email': email},
      );
    });
  }

  @override
  Future<ApiResult<void>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) {
    return _safeApiCall('resetPassword', () async {
      await _dio.post(
        ApiConstants.resetPassword,
        data: {'email': email, 'code': code, 'newPassword': newPassword},
      );
    });
  }

  @override
  Future<ApiResult<List<GovernorateModel>>> getGovernorates() {
    return _safeApiCall('getGovernorates', () async {
      final response = await _dio.get(ApiConstants.governorates);
      final data = ApiResponse<List<GovernorateModel>>.fromJson(
        response.data,
        (data) => List.from(data as List)
            .map(
              (json) => GovernorateModel.fromJson(json as Map<String, dynamic>),
            )
            .toList(),
      );
      return data.data;
    });
  }

  @override
  Future<ApiResult<List<DistrictsModel>>> getDistrictsByGovernorateId(
    String governorateId,
  ) {
    return _safeApiCall('getDistrictsByGovernorateId', () async {
      final response = await _dio.get(ApiConstants.districts(governorateId));
      final data = ApiResponse<List<DistrictsModel>>.fromJson(
        response.data,
        (data) => List.from(
          data as List,
        ).map((json) => DistrictsModel.fromJson(json)).toList(),
      );
      return data.data;
    });
  }
}
