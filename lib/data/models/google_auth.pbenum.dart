///
//  Generated code. Do not modify.
//  source: google_auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class MigrationPayload_Algorithm extends $pb.ProtobufEnum {
  static const MigrationPayload_Algorithm ALGO_INVALID = MigrationPayload_Algorithm._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALGO_INVALID');
  static const MigrationPayload_Algorithm ALGO_SHA1 = MigrationPayload_Algorithm._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALGO_SHA1');

  static const $core.List<MigrationPayload_Algorithm> values = <MigrationPayload_Algorithm> [
    ALGO_INVALID,
    ALGO_SHA1,
  ];

  static final $core.Map<$core.int, MigrationPayload_Algorithm> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MigrationPayload_Algorithm? valueOf($core.int value) => _byValue[value];

  const MigrationPayload_Algorithm._($core.int v, $core.String n) : super(v, n);
}

class MigrationPayload_OtpType extends $pb.ProtobufEnum {
  static const MigrationPayload_OtpType OTP_INVALID = MigrationPayload_OtpType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTP_INVALID');
  static const MigrationPayload_OtpType OTP_HOTP = MigrationPayload_OtpType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTP_HOTP');
  static const MigrationPayload_OtpType OTP_TOTP = MigrationPayload_OtpType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTP_TOTP');

  static const $core.List<MigrationPayload_OtpType> values = <MigrationPayload_OtpType> [
    OTP_INVALID,
    OTP_HOTP,
    OTP_TOTP,
  ];

  static final $core.Map<$core.int, MigrationPayload_OtpType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MigrationPayload_OtpType? valueOf($core.int value) => _byValue[value];

  const MigrationPayload_OtpType._($core.int v, $core.String n) : super(v, n);
}

