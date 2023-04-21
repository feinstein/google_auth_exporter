import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_auth_exporter/data/data_sources/qr_code_data_source.dart';
import 'package:google_auth_exporter/data/models/google_auth.pb.dart';
import 'package:google_auth_exporter/data/models/google_auth_totp.dart';
import 'package:google_auth_exporter/data/repositories/google_auth_repository.dart';

void main() {
  test('Should import correctly when given a correct QR Code', () async {
    final repository = GoogleAuthRepository(FakeQrCodeDataSource());
    final topts = await repository.import();

    final jsonPayload = {
      "1": [
        {"1": "AQIDBAUGBwgJCgsMDQ4PEBESExQ=", "2": "account.com:My Account", "3": "account.com", "4": 1, "5": 1, "6": 2},
        {"1": "AgMEBQYHCAkKCwwNDg8QERITFBU=", "2": "account.com:My Account2", "3": "account2.com", "4": 1, "5": 1, "6": 2},
      ],
      "2": 1,
      "3": 1,
      "4": 0,
      "5": 123456
    };

    final payload = MigrationPayload.fromJson(jsonEncode(jsonPayload));

    expect(topts, hasSamePayloadMatcher(payload));
  });
}

class FakeQrCodeDataSource implements QrCodeDataSource {
  @override
  Future<String?> scan() async {
    // TODO: DO NOT COMMIT THIS!!!!
    return 'otpauth-migration://offline?data=CkEKFAECAwQFBgcICQoLDA0ODxAREhMUEhZhY2NvdW50LmNvbTpNeSBBY2NvdW50GgthY2NvdW50LmNvbSABKAEwAgpDChQCAwQFBgcICQoLDA0ODxAREhMUFRIXYWNjb3VudC5jb206TXkgQWNjb3VudDIaDGFjY291bnQyLmNvbSABKAEwAhABGAEgACjAxAc=';
  }
}

HasSamePayloadMatcher hasSamePayloadMatcher(MigrationPayload payload) => HasSamePayloadMatcher(payload);

class HasSamePayloadMatcher extends Matcher {
  HasSamePayloadMatcher(this.payload);

  final MigrationPayload payload;

  @override
  Description describe(Description description) => description.add('Has the same payload');

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription, Map matchState, bool verbose) {
    int? index = matchState['errorIndex'];

    if (index != null) {
      return mismatchDescription.add('Payloads are different at index $index');
    }

    return mismatchDescription;
  }

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! Iterable || item.length != payload.otpParameters.length) {
      return false;
    }

    for (int i = 0; i < item.length; ++i) {
      final totp = item.elementAt(i) as GoogleAuthTotp;
      final otpParam = payload.otpParameters.elementAt(i);

      if (totp.name != otpParam.name || totp.issuer != otpParam.issuer || !listEquals(totp.secret, otpParam.secret)) {
        matchState['errorIndex'] = i;
        return false;
      }
    }

    return true;
  }
}
