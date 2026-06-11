import 'package:secure_banking_wallet_day13/features/auth/domain/entities/user_entity.dart';

class LoginResponseModel extends UserEntity {

  const LoginResponseModel({
    required super.token,
  });

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json) {

    return LoginResponseModel(
      token: json["token"],
    );
  }
}