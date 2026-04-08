import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/auth/domain/entities/user_entity.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final UserEntity? user;
  final ApiErrorModel? error;
  final String? email;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
    this.email,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserEntity? user,
    ApiErrorModel? error,
    String? email,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
      email: email ?? this.email,
    );
  }
}
