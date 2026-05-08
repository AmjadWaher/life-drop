import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/requests/domain/entities/reasons_cancellation_donation_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancellation_reasons_state.freezed.dart';

@freezed
class CancellationReasonsState with _$CancellationReasonsState {
  const factory CancellationReasonsState.initial() =
      _CancellationReasonsInitial;
  const factory CancellationReasonsState.loading() = CancellationReasonsLoading;
  const factory CancellationReasonsState.success(
    List<ReasonsCancellationDonationEntity> reasons,
  ) = CancellationReasonsSuccess;
  const factory CancellationReasonsState.error(ApiErrorModel error) =
      CancellationReasonsError;
}
