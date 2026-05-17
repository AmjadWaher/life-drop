import 'package:donor_app/features/profile/domain/entities/updated_profile_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'updated_profile_model.g.dart';

@JsonSerializable(createToJson: false)
class UpdatedProfileResponseModel extends UpdatedProfileResponseEntity {
  const UpdatedProfileResponseModel({
    required super.userId,
    required super.isAvailable,
    required super.governorateName,
    required super.districtName,
    required super.receiveCriticalNotifications,
    required super.receiveUrgentNotifications,
    required super.receiveNormalNotifications,
  });

  factory UpdatedProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatedProfileResponseModelFromJson(json);
}
