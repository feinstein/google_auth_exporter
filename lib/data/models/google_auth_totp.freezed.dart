// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_totp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthTotp {
  String get label => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;
  List<int> get secret => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthTotpCopyWith<GoogleAuthTotp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthTotpCopyWith<$Res> {
  factory $GoogleAuthTotpCopyWith(
          GoogleAuthTotp value, $Res Function(GoogleAuthTotp) then) =
      _$GoogleAuthTotpCopyWithImpl<$Res, GoogleAuthTotp>;
  @useResult
  $Res call({String label, String issuer, List<int> secret});
}

/// @nodoc
class _$GoogleAuthTotpCopyWithImpl<$Res, $Val extends GoogleAuthTotp>
    implements $GoogleAuthTotpCopyWith<$Res> {
  _$GoogleAuthTotpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? issuer = null,
    Object? secret = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      secret: null == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleAuthTotpCopyWith<$Res>
    implements $GoogleAuthTotpCopyWith<$Res> {
  factory _$$_GoogleAuthTotpCopyWith(
          _$_GoogleAuthTotp value, $Res Function(_$_GoogleAuthTotp) then) =
      __$$_GoogleAuthTotpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String issuer, List<int> secret});
}

/// @nodoc
class __$$_GoogleAuthTotpCopyWithImpl<$Res>
    extends _$GoogleAuthTotpCopyWithImpl<$Res, _$_GoogleAuthTotp>
    implements _$$_GoogleAuthTotpCopyWith<$Res> {
  __$$_GoogleAuthTotpCopyWithImpl(
      _$_GoogleAuthTotp _value, $Res Function(_$_GoogleAuthTotp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? issuer = null,
    Object? secret = null,
  }) {
    return _then(_$_GoogleAuthTotp(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      secret: null == secret
          ? _value._secret
          : secret // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_GoogleAuthTotp extends _GoogleAuthTotp {
  const _$_GoogleAuthTotp(
      {required this.label,
      required this.issuer,
      required final List<int> secret})
      : _secret = secret,
        super._();

  @override
  final String label;
  @override
  final String issuer;
  final List<int> _secret;
  @override
  List<int> get secret {
    if (_secret is EqualUnmodifiableListView) return _secret;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secret);
  }

  @override
  String toString() {
    return 'GoogleAuthTotp(label: $label, issuer: $issuer, secret: $secret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleAuthTotp &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            const DeepCollectionEquality().equals(other._secret, _secret));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, label, issuer, const DeepCollectionEquality().hash(_secret));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleAuthTotpCopyWith<_$_GoogleAuthTotp> get copyWith =>
      __$$_GoogleAuthTotpCopyWithImpl<_$_GoogleAuthTotp>(this, _$identity);
}

abstract class _GoogleAuthTotp extends GoogleAuthTotp {
  const factory _GoogleAuthTotp(
      {required final String label,
      required final String issuer,
      required final List<int> secret}) = _$_GoogleAuthTotp;
  const _GoogleAuthTotp._() : super._();

  @override
  String get label;
  @override
  String get issuer;
  @override
  List<int> get secret;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleAuthTotpCopyWith<_$_GoogleAuthTotp> get copyWith =>
      throw _privateConstructorUsedError;
}
