import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/requests/domain/repository/requests_repository.dart';
import 'package:donor_app/features/requests/presentation/logic/cancellation_reasons/cancellation_reasons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancellationReasonsCubit extends Cubit<CancellationReasonsState> {
  final RequestsRepository _repository;
  CancellationReasonsCubit(this._repository)
    : super(const CancellationReasonsState.initial());

  Future<void> getCancellationReasons() async {
    emit(const CancellationReasonsState.loading());

    final result = await _repository.getDonationCancellationReasons();
    result.when(
      success: (data) => emit(CancellationReasonsState.success(data)),
      failure: (error) => emit(CancellationReasonsState.error(error)),
    );
  }
}
