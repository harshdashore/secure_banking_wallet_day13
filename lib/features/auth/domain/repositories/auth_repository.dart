import 'package:dartz/dartz.dart';
import 'package:secure_banking_wallet_day13/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login(
      String email,
      String password);
}