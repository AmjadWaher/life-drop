class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'http://192.168.1.242:7894/api';
  static const String realtimeBaseUrl = 'http://192.168.1.242:7894';

  static const String auth = '$baseUrl/auth';
  static const String refreshToken = '$auth/refresh';

  static const String donors = '$baseUrl/donors';
  static const String locations = '$baseUrl/locations';
  static const String donationRequests = '$baseUrl/donationRequests';
  static const String referenceData = '$baseUrl/referenceData';
  static const String notifications = '$baseUrl/notifications';
  static const String donationsHub = '$realtimeBaseUrl/hubs/donations';
}
