import 'package:dio/dio.dart';
import 'package:donor_app/core/networking/dio_factory.dart';
import 'package:donor_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:donor_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:donor_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
}
