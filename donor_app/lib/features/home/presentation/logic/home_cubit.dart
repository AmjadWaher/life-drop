import 'package:donor_app/core/helpers/biometric_helper.dart';
import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/home/domain/repositories/home_repository.dart';
import 'package:donor_app/features/home/presentation/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final BiometricHelper _biometricHelper;
  final HomeRepository _homeRepository;

  HomeCubit({
    required BiometricHelper biometricHelper,
    required HomeRepository homeRepository,
  }) : _biometricHelper = biometricHelper,
       _homeRepository = homeRepository,
       super(const HomeState.initial());

  Future<void> loadHome() async {
    emit(const HomeState.loading());
    final result = await _homeRepository.getHomeData();

    result.when(
      success: (data) => emit(HomeState.success(data)),
      failure: (error) => emit(HomeState.error(error)),
    );
  }

  Future<void> checkBiometricPrompt() async {
    final alreadyShown = await SharedPrefHelper.getBool(
      SharedPrefKeys.biometricPromptShown,
    );
    if (alreadyShown) return;

    final isCapable = await _biometricHelper.isDeviceCapable();
    final isAvailable = await _biometricHelper.isBiometricEnabled();

    if (isCapable && isAvailable) {
      emit(const HomeState.biometricPromptRequired());
    }
  }
}
