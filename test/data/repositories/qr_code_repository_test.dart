import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_auth_exporter/domain/qr_code_generator_use_case.dart';

void main() {
  test('Should generate the corret QR Code data when the contents are correct', () {
    final secret = List.generate(20, (index) => index + 1);
    final qrCodeGeneratorUseCase = QrCodeGeneratorUseCase();
    final qrCodeData = qrCodeGeneratorUseCase(label: 'account.com:My Account', issuer: 'account.com', secret: Uint8List.fromList(secret));
    const expectedQrCodeData = 'otpauth://totp/account.com:My%20Account?secret=AEBAGBAFAYDQQCIKBMGA2DQPCAIREEYU&issuer=account.com';

    expect(qrCodeData, expectedQrCodeData);
  });
}