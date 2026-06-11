import 'package:encrypt/encrypt.dart';

class EncryptionService {

  final key = Key.fromUtf8(
      "12345678901234567890123456789012");

  final iv = IV.fromLength(16);

  String encryptText(String text) {

    final encrypter =
    Encrypter(AES(key));

    return encrypter.encrypt(
      text,
      iv: iv,
    ).base64;
  }

  String decryptText(String encrypted) {

    final encrypter =
    Encrypter(AES(key));

    return encrypter.decrypt64(
      encrypted,
      iv: iv,
    );
  }
}