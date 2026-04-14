import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
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
                emit(state.copyWith(status: AuthStatus.success, data: user)),
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
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        action: AuthAction.login,
        email: email,
      ),
    );

    final result = await _authRepository.login(email, password);
    result.when(
      success: (user) =>
          emit(state.copyWith(status: AuthStatus.success, data: user)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> register(RegisterParams params) async {
    emit(
      state.copyWith(status: AuthStatus.loading, action: AuthAction.register),
    );

    final result = await _authRepository.register(params);
    result.when(
      success: (data) =>
          emit(state.copyWith(status: AuthStatus.success, data: null)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(
      state.copyWith(status: AuthStatus.loading, action: AuthAction.verifyOtp),
    );

    final result = await _authRepository.verifyOtp(email, otp);
    result.when(
      success: (_) {
        SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
        emit(state.copyWith(status: AuthStatus.success));
      },
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> sendOtp(String email) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        email: email,
        action: AuthAction.none,
      ),
    );

    final result = await _authRepository.sendOtp(email);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> resetPassword(String newPassword) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.resetPassword(newPassword);
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
