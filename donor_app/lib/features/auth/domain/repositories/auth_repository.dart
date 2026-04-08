import 'package:donor_app/core/networking/api_result.dart';
import '../entities/user_entity.dart';
import '../params/register_params.dart';

abstract class AuthRepository {
  Future<ApiResult<UserEntity>> login(String email, String password);
  Future<ApiResult<UserEntity>> register(RegisterParams params);
  Future<ApiResult<void>> verifyOtpForRegister(String email, String otp);
  Future<ApiResult<void>> sendOtpForForgotPassword(String email);
  Future<ApiResult<void>> verifyOtpForForgotPassword(String email, String otp);
  Future<ApiResult<void>> resetPassword(String email, String newPassword);
  Future<ApiResult<void>> logout();
  Future<ApiResult<UserEntity>> getCurrentUser();
  Future<ApiResult<bool>> isLoggedIn();
}
