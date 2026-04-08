import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/auth/domain/params/register_params.dart';
import 'package:donor_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState());

  Future<void> checkAuthStatus() async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.isLoggedIn();
    result.when(
      success: (isLoggedIn) async {
        if (isLoggedIn) {
          final userResult = await _authRepository.getCurrentUser();
          userResult.when(
            success: (user) =>
                emit(state.copyWith(status: AuthStatus.success, user: user)),
            failure: (error) =>
                emit(state.copyWith(status: AuthStatus.failure, error: error)),
          );
        } else {
          emit(state.copyWith(status: AuthStatus.failure));
        }
      },
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading, email: email));

    final result = await _authRepository.login(email, password);
    result.when(
      success: (user) =>
          emit(state.copyWith(status: AuthStatus.success, user: user)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> register(RegisterParams params) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.register(params);
    result.when(
      success: (user) =>
          emit(state.copyWith(status: AuthStatus.success, user: user)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> verifyOtpForRegister(String email, String otp) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.verifyOtpForRegister(email, otp);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> sendOtpForForgotPassword(String email) async {
    emit(state.copyWith(status: AuthStatus.loading, email: email));

    final result = await _authRepository.sendOtpForForgotPassword(email);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> verifyOtpForForgotPassword(String email, String otp) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.verifyOtpForForgotPassword(email, otp);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> resetPassword(String email, String newPassword) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.resetPassword(email, newPassword);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    await _authRepository.logout();
    emit(const AuthState(status: AuthStatus.failure));
  }

  void clearError() {
    emit(state.copyWith(status: AuthStatus.initial, error: null));
  }
}
