import 'package:secure_banking_wallet_day13/features/auth/data/models/login_response_model.dart';

class AuthRemoteDataSource {

  Future<LoginResponseModel> login(
      String email,
      String password,
      ) async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (email == "admin@securepay.com" &&
        password == "Admin@123") {

      return const LoginResponseModel(
        token: "jwt_demo_token_123456",
      );
    }

    throw Exception(
      "Invalid Credentials",
    );
  }
}