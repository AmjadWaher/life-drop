import 'dart:convert';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/core/networking/api_error_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/params/register_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  static const _tokenKey = 'auth_token';
  static const _userKey = 'cached_user';

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<UserEntity>> login(String email, String password) async {
    final result = await _remoteDataSource.login(email, password);
    return result.when(
      success: (user) async {
        await _cacheUser(user.data);
        return ApiResult.success(user.data);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> register(RegisterParams params) async {
    final result = await _remoteDataSource.register(params);
    return result.when(
      success: (response) async {
        return ApiResult.success(response.data);
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
  Future<ApiResult<void>> resetPassword(String newPassword) async {
    final result = await _remoteDataSource.resetPassword(newPassword);
    return result.when(
      success: (response) async {
        return ApiResult.success(null);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<void>> logout() async {
    await SharedPrefHelper.removeAllSecuredData();
    return ApiResult.success(null);
  }

  @override
  Future<ApiResult<UserEntity>> getCurrentUser() async {
    final userJson = await SharedPrefHelper.getSecuredString(_userKey);
    if (userJson.isEmpty) {
      return ApiResult.failure(ApiErrorModel(message: 'No user found'));
    }
    try {
      final user = UserModel.fromJson(jsonDecode(userJson));
      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel(message: 'Failed to parse user data'),
      );
    }
  }

  @override
  Future<ApiResult<bool>> isLoggedIn() async {
    final token = await SharedPrefHelper.getSecuredString(_tokenKey);
    return ApiResult.success(token.isNotEmpty);
  }

  Future<void> _cacheUser(UserModel user) async {
    await SharedPrefHelper.setSecuredString(
      _userKey,
      jsonEncode(user.toJson()),
    );
  }
}
