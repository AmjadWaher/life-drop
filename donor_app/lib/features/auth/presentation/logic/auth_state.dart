import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/auth/domain/entities/user_entity.dart';

enum AuthStatus { initial, loading, success, failure }

enum AuthAction { none, login, register, verifyOtp }

class AuthState {
  final AuthStatus status;
  final UserEntity? data;
  final ApiErrorModel? error;
  final AuthAction action;
  final String? email;

  const AuthState({
    this.status = AuthStatus.initial,
    this.action = AuthAction.none,
    this.data,
    this.error,
    this.email,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthAction? action,
    UserEntity? data,
    ApiErrorModel? error,
    String? email,
  }) {
    return AuthState(
      status: status ?? this.status,
      action: action ?? this.action,
      data: data ?? this.data,
      error: error,
      email: email ?? this.email,
    );
  }
}
