import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/features/auth/domain/entities/districts_entity.dart';
import 'package:donor_app/features/auth/domain/entities/governorate_entity.dart';
import 'package:donor_app/features/auth/domain/entities/login_response_entity.dart';

enum AuthStatus { initial, loading, success, failure }

enum AuthAction { none, login, register, verifyOtp, verifyRegistration }

enum GovernoratesStatus { initial, loading, success, failure }

enum DistrictsStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final LoginResponseEntity? data;
  final ApiErrorModel? error;
  final AuthAction action;
  final String? email;
  final GovernoratesStatus governoratesStatus;
  final DistrictsStatus districtsStatus;
  final List<GovernorateEntity> governorates;
  final List<DistrictsEntity> districts;

  const AuthState({
    this.status = AuthStatus.initial,
    this.action = AuthAction.none,
    this.data,
    this.error,
    this.email,
    this.governoratesStatus = GovernoratesStatus.initial,
    this.districtsStatus = DistrictsStatus.initial,
    this.governorates = const [],
    this.districts = const [],
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthAction? action,
    LoginResponseEntity? data,
    ApiErrorModel? error,
    String? email,
    GovernoratesStatus? governoratesStatus,
    DistrictsStatus? districtsStatus,
    List<GovernorateEntity>? governorates,
    List<DistrictsEntity>? districts,
  }) {
    return AuthState(
      status: status ?? this.status,
      action: action ?? this.action,
      data: data ?? this.data,
      error: error ?? this.error,
      email: email ?? this.email,
      governoratesStatus: governoratesStatus ?? this.governoratesStatus,
      districtsStatus: districtsStatus ?? this.districtsStatus,
      governorates: governorates ?? this.governorates,
      districts: districts ?? this.districts,
    );
  }
}
