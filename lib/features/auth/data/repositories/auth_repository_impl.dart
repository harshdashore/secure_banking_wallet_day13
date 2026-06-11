import 'package:dartz/dartz.dart';
import 'package:secure_banking_wallet_day13/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/entities/user_entity.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl
    implements AuthRepository {

  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<String, UserEntity>> login(
      String email,
      String password) async {

    try {

      final result =
      await remote.login(
        email,
        password,
      );

      return Right(result);

    } catch (e) {

      return Left(e.toString());
    }
  }
}