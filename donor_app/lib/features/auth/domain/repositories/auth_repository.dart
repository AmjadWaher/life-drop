import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/auth/domain/entities/districts_entity.dart';
import 'package:donor_app/features/auth/domain/entities/governorate_entity.dart';
import '../entities/login_response_entity.dart';
import '../params/register_params.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponseEntity>> login(String email, String password);
  Future<ApiResult<void>> register(RegisterParams params);
  Future<ApiResult<List<GovernorateEntity>>> getGovernorates();
  Future<ApiResult<List<DistrictsEntity>>> getDistrictsByGovernorate(
    String governorateId,
  );
  Future<ApiResult<void>> verifyOtp(String email, String otp);
  Future<ApiResult<void>> verifyRegistration(String email, String code);
  Future<ApiResult<void>> sendOtp(String email);
  Future<ApiResult<void>> resendOtp(String email);
  Future<ApiResult<void>> resendRegistrationOtp(String email);
  Future<ApiResult<void>> resetPassword(
    String email,
    String code,
    String newPassword,
  );
}
