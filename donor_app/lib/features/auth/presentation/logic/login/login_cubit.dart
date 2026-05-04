import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await _authRepository.login(email, password);
    result.when(
      success: (data) {
        SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
        emit(state.copyWith(status: LoginStatus.success, data: data));
      },
      failure: (error) =>
          emit(state.copyWith(status: LoginStatus.failure, error: error)),
    );
  }
}
