class LoginResponseEntity {
  final String accessToken;
  final String refreshToken;

  const LoginResponseEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
