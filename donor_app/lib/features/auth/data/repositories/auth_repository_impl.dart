import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/auth/domain/entities/districts_entity.dart';
import 'package:donor_app/features/auth/domain/entities/governorate_entity.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/params/register_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<LoginResponseEntity>> login(
    String email,
    String password,
  ) async {
    final result = await _remoteDataSource.login(email, password);
    return result.when(
      success: (response) async {
        await _cacheAccess(response.accessToken, response.refreshToken);
        return ApiResult.success(response);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> register(RegisterParams params) async {
    final result = await _remoteDataSource.register(params);
    return result.when(
      success: (response) async {
        return ApiResult.success(response);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> verifyOtp(String email, String otp) async {
    final result = await _remoteDataSource.verifyOtp(email, otp);
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> verifyRegistration(String email, String code) async {
    final result = await _remoteDataSource.verifyRegistration(email, code);
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> sendOtp(String email) async {
    final result = await _remoteDataSource.sendOtp(email);
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> resendOtp(String email) async {
    final result = await _remoteDataSource.resendOtp(email);
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    final result = await _remoteDataSource.resetPassword(
      email: email,
      code: code,
      newPassword: newPassword,
    );
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  Future<void> _cacheAccess(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.accessToken,
      accessToken,
    );
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.refreshToken,
      refreshToken,
    );
  }

  @override
  Future<ApiResult<List<DistrictsEntity>>> getDistrictsByGovernorate(
    String governorateId,
  ) async {
    final result = await _remoteDataSource.getDistrictsByGovernorateId(
      governorateId,
    );
    return result.when(
      success: (response) async {
        return ApiResult.success(response);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<GovernorateEntity>>> getGovernorates() async {
    final result = await _remoteDataSource.getGovernorates();
    return result.when(
      success: (response) async {
        return ApiResult.success(response);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
