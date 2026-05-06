import 'package:donor_app/core/helpers/biometric_helper.dart';
import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/features/home/domain/entities/donation_request_entity.dart';
import 'package:donor_app/features/home/presentation/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final BiometricHelper _biometricHelper;

  HomeCubit({required BiometricHelper biometricHelper})
    : _biometricHelper = biometricHelper,
      super(const HomeState.initial());

  Future<void> loadHome() async {
    emit(const HomeState.loading());
    try {
      // Mocked data since repository is not implemented yet
      final mockRequests = [
        const DonationRequestEntity(
          id: '1',
          bloodType: 'O+',
          urgency: UrgencyLevel.high,
          distanceKm: 2.4,
          hospitalName: 'St. Jude Medical',
          description:
              'Emergency surgery requirement. Needs 3 units by tonight',
        ),
        const DonationRequestEntity(
          id: '2',
          bloodType: 'B-',
          urgency: UrgencyLevel.scheduled,
          distanceKm: 5.1,
          hospitalName: 'City Blood Bank',
          description:
              'Rare type inventory replenishment. Donor needed for Friday.',
        ),
      ];
      emit(HomeState.success(mockRequests));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
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
