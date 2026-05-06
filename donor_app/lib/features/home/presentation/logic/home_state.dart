import 'package:donor_app/features/home/domain/entities/donation_request_entity.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.success(List<DonationRequestEntity> requests) =
      HomeSuccess;
  const factory HomeState.error(String message) = HomeError;
  const factory HomeState.biometricPromptRequired() =
      HomeBiometricPromptRequired;

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final List<DonationRequestEntity> requests;

  const HomeSuccess(this.requests);

  @override
  List<Object?> get props => [requests];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeBiometricPromptRequired extends HomeState {
  const HomeBiometricPromptRequired();
}
