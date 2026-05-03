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
      success: (data) {
        SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
        emit(state.copyWith(status: AuthStatus.success, data: data));
      },
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
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> verifyRegistration(String email, String code) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        action: AuthAction.verifyRegistration,
      ),
    );

    final result = await _authRepository.verifyRegistration(email, code);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
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

  Future<void> resendOtp(String email) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        email: email,
        action: AuthAction.none,
      ),
    );

    final result = await _authRepository.resendOtp(email);
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await _authRepository.resetPassword(
      email,
      code,
      newPassword,
    );
    result.when(
      success: (_) => emit(state.copyWith(status: AuthStatus.success)),
      failure: (error) =>
          emit(state.copyWith(status: AuthStatus.failure, error: error)),
    );
  }

  Future<void> getGovernorates() async {
    emit(state.copyWith(governoratesStatus: GovernoratesStatus.loading));

    final result = await _authRepository.getGovernorates();
    result.when(
      success: (governorates) => emit(
        state.copyWith(
          governoratesStatus: GovernoratesStatus.success,
          governorates: governorates,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          governoratesStatus: GovernoratesStatus.failure,
          error: error,
        ),
      ),
    );
  }

  Future<void> getDistrictsByGovernorateId(String governorateId) async {
    emit(state.copyWith(districtsStatus: DistrictsStatus.loading));

    if (governorateId == '-1') {
      emit(
        state.copyWith(
          districtsStatus: DistrictsStatus.success,
          districts: const [],
        ),
      );
      return;
    }

    final result = await _authRepository.getDistrictsByGovernorate(
      governorateId,
    );
    result.when(
      success: (districts) => emit(
        state.copyWith(
          districtsStatus: DistrictsStatus.success,
          districts: districts,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(districtsStatus: DistrictsStatus.failure, error: error),
      ),
    );
  }
}
