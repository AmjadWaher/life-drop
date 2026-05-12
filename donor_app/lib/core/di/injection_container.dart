import 'package:dio/dio.dart';
import 'package:donor_app/core/helpers/biometric_helper.dart';
import 'package:donor_app/core/networking/dio_factory.dart';
import 'package:donor_app/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:donor_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:donor_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:donor_app/features/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/otp/otp_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/reset_password/reset_password_cubit.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/requests/data/datasource/requests_remote_datasource_impl.dart';
import 'package:donor_app/features/requests/data/repository/requests_repository_impl.dart';
import 'package:donor_app/features/requests/domain/repository/requests_repository.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/cancel_donation/cancel_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/cancellation_reasons/cancellation_reasons_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> initDependencies() async {
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<BiometricHelper>(() => BiometricHelper());

  // --------------- Auth ---------------

  getIt.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSourceImpl>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));

  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<AuthRepository>()),
  );

  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt<AuthRepository>()));

  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<AuthRepository>()),
  );

  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<AuthRepository>()),
  );

  // --------------- Home ---------------

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(biometricHelper: getIt<BiometricHelper>()),
  );

  // --------------- Requests ---------------

  getIt.registerLazySingleton<RequestsRemoteDatasourceImpl>(
    () => RequestsRemoteDatasourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<RequestsRepository>(
    () => RequestsRepositoryImpl(getIt<RequestsRemoteDatasourceImpl>()),
  );

  getIt.registerFactory<ActiveDonationCubit>(
    () => ActiveDonationCubit(getIt<RequestsRepository>()),
  );
  getIt.registerFactory<CancelDonationCubit>(
    () => CancelDonationCubit(getIt<RequestsRepository>()),
  );
  getIt.registerFactory<CancellationReasonsCubit>(
    () => CancellationReasonsCubit(getIt<RequestsRepository>()),
  );
}
