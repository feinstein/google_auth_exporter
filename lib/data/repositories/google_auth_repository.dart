import 'dart:convert';

import 'package:google_auth_exporter/data/models/google_auth.pb.dart';
import 'package:google_auth_exporter/data/models/google_auth_totp.dart';

import '../data_sources/qr_code_data_source.dart';

class GoogleAuthRepository {
  GoogleAuthRepository(this.qrCodeDataSource);

  final QrCodeDataSource qrCodeDataSource;

  Future<List<GoogleAuthTotp>?> import() async {
    final qrCodeContent = await qrCodeDataSource.scan();

    if (qrCodeContent == null) {
      return null;
    }

    if (!qrCodeContent.startsWith('otpauth-migration://offline?data=')) {
      throw InvalidQrCodeException._();
    }

    final uri = Uri.parse(qrCodeContent);
    final data = uri.queryParameters['data']!;
    final buffer = base64Decode(data);
    final payload = MigrationPayload.fromBuffer(buffer);

    return payload.otpParameters.map(
      (otpParam) {
        return GoogleAuthTotp(
          secret: otpParam.secret,
          label: otpParam.name,
          issuer: otpParam.issuer,
        );
      },
    ).toList(growable: false);
  }
}

abstract class GoogleAuthRepositoryException implements Exception {
  GoogleAuthRepositoryException._(this.message);

  final String message;
}

class InvalidQrCodeException extends GoogleAuthRepositoryException {
  InvalidQrCodeException._() : super._('Invalid QR Code');
}
