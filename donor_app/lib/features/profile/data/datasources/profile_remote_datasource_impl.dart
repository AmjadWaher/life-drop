import 'package:dio/dio.dart';
import 'package:donor_app/core/mixins/safe_api_call_mixin.dart';
import 'package:donor_app/core/networking/api_response.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/profile/data/datasources/profile_constatns.dart';
import 'package:donor_app/features/profile/data/models/cooldown_model.dart';
import 'package:donor_app/features/profile/data/models/updated_profile_model.dart';
import 'package:donor_app/features/profile/data/models/user_model.dart';
import 'package:donor_app/features/profile/data/requests/update_profile_request.dart';

abstract class ProfileRemoteDatasource {
  Future<ApiResult<UserModel>> getProfile();
  Future<ApiResult<CooldownModel>> getCooldownStatus();
  Future<ApiResult<UpdatedProfileResponseModel>> updateProfile(
    UpdateProfileRequest request,
  );
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource
    with SafeApiCallMixin {
  final Dio _dio;

  ProfileRemoteDatasourceImpl(this._dio);

  @override
  Future<ApiResult<UserModel>> getProfile() {
    return safeApiCall('getProfile', () async {
      final response = await _dio.get(ProfileConstatns.profile);

      final result = ApiResponse<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return result.data;
    });
  }

  @override
  Future<ApiResult<UpdatedProfileResponseModel>> updateProfile(
    UpdateProfileRequest request,
  ) {
    return safeApiCall('updateProfile', () async {
      final response = await _dio.put(
        ProfileConstatns.profile,
        data: request.toJson(),
      );

      final result = ApiResponse<UpdatedProfileResponseModel>.fromJson(
        response.data,
        (json) =>
            UpdatedProfileResponseModel.fromJson(json as Map<String, dynamic>),
      );

      return result.data;
    });
  }

  @override
  Future<ApiResult<CooldownModel>> getCooldownStatus() {
    return safeApiCall('getCooldownStatus', () async {
      final response = await _dio.get(ProfileConstatns.cooldown);
      final result = ApiResponse<CooldownModel>.fromJson(
        response.data,
        (json) => CooldownModel.fromJson(json as Map<String, dynamic>),
      );
      return result.data;
    });
  }
}
