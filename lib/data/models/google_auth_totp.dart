import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_auth_totp.freezed.dart';

@freezed
class GoogleAuthTotp with _$GoogleAuthTotp {
  const factory GoogleAuthTotp({
    required String name,
    required String issuer,
    required List<int> secret,
  }) = _GoogleAuthTotp;
}
