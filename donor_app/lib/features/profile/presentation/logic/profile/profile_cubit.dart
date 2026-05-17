import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/profile/data/requests/update_profile_request.dart';
import 'package:donor_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:donor_app/features/profile/presentation/logic/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit(this._repository) : super(const ProfileState.initial());

  Future<void> getUserProfile() async {
    emit(const ProfileState.loading());

    final result = await _repository.getProfile();
    result.when(
      success: (data) => emit(ProfileState.getProfileSuccess(data)),
      failure: (error) => emit(ProfileState.error(error)),
    );
  }

  Future<void> updateUserProfile(UpdateProfileRequest request) async {
    emit(const ProfileState.loading());

    final result = await _repository.updateProfile(request);
    result.when(
      success: (data) => emit(ProfileState.updateProfileSuccess(data)),
      failure: (error) => emit(ProfileState.error(error)),
    );
  }
}
