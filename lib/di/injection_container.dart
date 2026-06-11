import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_banking_wallet_day13/core/security/aes_encryption_service.dart';
import 'package:secure_banking_wallet_day13/core/security/biometric_service.dart';
import 'package:secure_banking_wallet_day13/core/security/secure_storage_service.dart';
import 'package:secure_banking_wallet_day13/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:secure_banking_wallet_day13/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/repositories/auth_repository.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/usecases/login_usecase.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/blocs/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(
        () => Dio(),
  );

  sl.registerLazySingleton(
        () => SecureStorageService(),
  );

  sl.registerLazySingleton(
        () => EncryptionService(),
  );

  sl.registerLazySingleton(
        () => BiometricService(),
  );

  sl.registerLazySingleton(
        () => AuthRemoteDataSource(),
  );

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton(
        () => LoginUseCase(
      sl(),
    ),
  );

  sl.registerFactory(
        () => AuthBloc(
      sl(),
    ),
  );
}