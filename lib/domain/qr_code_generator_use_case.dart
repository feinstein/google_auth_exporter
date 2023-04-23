import 'dart:typed_data';

import 'package:base32/base32.dart';

class QrCodeGeneratorUseCase {
  String call({required String label, required String issuer, required Uint8List secret}) {
    final base32Secret = base32.encode(secret);
    final uri = Uri(
      scheme: 'otpauth',
      host: 'totp',
      path: label,
      queryParameters: {
        'secret': base32Secret,
        'issuer': issuer,
      },
    );
    return uri.toString();
  }
}
