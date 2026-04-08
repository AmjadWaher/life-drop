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
        await _cacheUser(user);
        return ApiResult.success(user);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<UserEntity>> register(RegisterParams params) async {
    return await _remoteDataSource.register(params);
  }

  @override
  Future<ApiResult<void>> verifyOtpForRegister(String email, String otp) async {
    return await _remoteDataSource.verifyOtpForRegister(email, otp);
  }

  @override
  Future<ApiResult<void>> sendOtpForForgotPassword(String email) async {
    return await _remoteDataSource.sendOtpForForgotPassword(email);
  }

  @override
  Future<ApiResult<void>> verifyOtpForForgotPassword(
    String email,
    String otp,
  ) async {
    return await _remoteDataSource.verifyOtpForForgotPassword(email, otp);
  }

  @override
  Future<ApiResult<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    return await _remoteDataSource.resetPassword(email, newPassword);
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
