class ApiConstants {
  static const String baseUrl = 'http://192.168.1.221:7894/api';
  static const String auth = '$baseUrl/auth';
  static const String donors = '$baseUrl/Donors';
  static const String login = '$auth/login';
  static const String register = '$donors/register';
  static const String verifyRegistration = '$donors/verify-registration';
  static const String governorates = '$baseUrl/locations/governorates';
  static String districts(String governorateId) =>
      '$governorates/$governorateId/districts';
  static const String verifyOtp = '$auth/verify-otp';
  static const String sendOtp = '$auth/forgot-password';
  static const String resetPassword = '$auth/reset-password';
  static const String resendOtp = '$auth/resend-otp';
}
