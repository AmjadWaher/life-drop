import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/auth/domain/entities/login_response_entity.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  final LoginStatus status;
  final LoginResponseEntity? data;
  final ApiErrorModel? error;

  const LoginState({
    this.status = LoginStatus.initial,
    this.data,
    this.error,
  });

  LoginState copyWith({
    LoginStatus? status,
    LoginResponseEntity? data,
    ApiErrorModel? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
