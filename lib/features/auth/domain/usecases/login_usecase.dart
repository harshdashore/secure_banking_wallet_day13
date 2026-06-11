import 'package:dartz/dartz.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/entities/user_entity.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, UserEntity>> call(
      String email,
      String password) {

    return repository.login(
      email,
      password,
    );
  }
}