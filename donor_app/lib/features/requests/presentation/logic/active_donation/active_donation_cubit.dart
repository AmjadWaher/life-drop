import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/requests/domain/repository/requests_repository.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveDonationCubit extends Cubit<ActiveDonationState> {
  final RequestsRepository _repository;
  ActiveDonationCubit(this._repository)
    : super(const ActiveDonationState.initial());

  Future<void> getCurrentActiveDonation() async {
    emit(const ActiveDonationState.loading());

    final result = await _repository.getCurrentActiveDonation();
    result.when(
      success: (data) {
        if (data == null) {
          emit(const ActiveDonationState.empty());
        } else {
          emit(ActiveDonationState.success(data));
        }
      },
      failure: (error) => emit(ActiveDonationState.error(error)),
    );
  }
}
