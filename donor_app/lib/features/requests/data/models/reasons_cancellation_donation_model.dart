import 'package:donor_app/features/requests/domain/entities/reasons_cancellation_donation_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reasons_cancellation_donation_model.g.dart';

@JsonSerializable(createToJson: false)
class ReasonsCancellationDonationModel
    extends ReasonsCancellationDonationEntity {
  const ReasonsCancellationDonationModel({
    required super.id,
    required super.displayName,
    required super.displayNameAr,
    required super.displayNameEn,
  });

  factory ReasonsCancellationDonationModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ReasonsCancellationDonationModelFromJson(json);
}
