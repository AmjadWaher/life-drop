import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/profile/domain/entities/updated_profile_response_entity.dart';
import 'package:donor_app/features/profile/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.getProfileSuccess(UserEntity user) =
      GetProfileSuccess;
  const factory ProfileState.updateProfileSuccess(
    UpdatedProfileResponseEntity response,
  ) = UpdateProfileSuccess;
  const factory ProfileState.error(ApiErrorModel error) = ProfileError;
}
