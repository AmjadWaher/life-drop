class ApiConstants {
  static const String baseUrl = 'http://192.168.94.1:7894/api';
  static const String auth = '$baseUrl/auth';
  static const String donors = '$baseUrl/Donors';

  //-------------- Auth --------------

  static const String login = '$auth/login';
  static const String verifyOtp = '$auth/verify-otp';
  static const String sendOtp = '$auth/forgot-password';
  static const String resetPassword = '$auth/reset-password';
  static const String resendOtp = '$auth/resend-otp';

  //-------------- Location --------------

  static const String governorates = '$baseUrl/locations/governorates';
  static String districts(String governorateId) =>
      '$governorates/$governorateId/districts';

  //-------------- Donors --------------

  static const String register = '$donors/register';
  static const String verifyRegistration = '$donors/verify-registration';
  static const String resendRegistrationOtp = '$donors/resend-registration-otp';
}
