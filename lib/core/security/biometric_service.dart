import 'package:local_auth/local_auth.dart';

class BiometricService {

  final LocalAuthentication auth =
  LocalAuthentication();

  Future<bool> authenticate() async {

    return await auth.authenticate(
      localizedReason:
      "Authenticate to continue",
    );
  }
}