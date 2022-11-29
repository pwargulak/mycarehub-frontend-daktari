// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'consent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Consent _$ConsentFromJson(Map<String, dynamic> json) {
  return _Consent.fromJson(json);
}

/// @nodoc
mixin _$Consent {
  @JsonKey(name: 'consentStatus')
  ConsentStatus? get consentStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsentCopyWith<Consent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsentCopyWith<$Res> {
  factory $ConsentCopyWith(Consent value, $Res Function(Consent) then) =
      _$ConsentCopyWithImpl<$Res, Consent>;
  @useResult
  $Res call({@JsonKey(name: 'consentStatus') ConsentStatus? consentStatus});
}

/// @nodoc
class _$ConsentCopyWithImpl<$Res, $Val extends Consent>
    implements $ConsentCopyWith<$Res> {
  _$ConsentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      consentStatus: freezed == consentStatus
          ? _value.consentStatus
          : consentStatus // ignore: cast_nullable_to_non_nullable
              as ConsentStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsentCopyWith<$Res> implements $ConsentCopyWith<$Res> {
  factory _$$_ConsentCopyWith(
          _$_Consent value, $Res Function(_$_Consent) then) =
      __$$_ConsentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'consentStatus') ConsentStatus? consentStatus});
}

/// @nodoc
class __$$_ConsentCopyWithImpl<$Res>
    extends _$ConsentCopyWithImpl<$Res, _$_Consent>
    implements _$$_ConsentCopyWith<$Res> {
  __$$_ConsentCopyWithImpl(_$_Consent _value, $Res Function(_$_Consent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consentStatus = freezed,
  }) {
    return _then(_$_Consent(
      consentStatus: freezed == consentStatus
          ? _value.consentStatus
          : consentStatus // ignore: cast_nullable_to_non_nullable
              as ConsentStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Consent implements _Consent {
  _$_Consent({@JsonKey(name: 'consentStatus') this.consentStatus});

  factory _$_Consent.fromJson(Map<String, dynamic> json) =>
      _$$_ConsentFromJson(json);

  @override
  @JsonKey(name: 'consentStatus')
  final ConsentStatus? consentStatus;

  @override
  String toString() {
    return 'Consent(consentStatus: $consentStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Consent &&
            (identical(other.consentStatus, consentStatus) ||
                other.consentStatus == consentStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, consentStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsentCopyWith<_$_Consent> get copyWith =>
      __$$_ConsentCopyWithImpl<_$_Consent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsentToJson(
      this,
    );
  }
}

abstract class _Consent implements Consent {
  factory _Consent(
      {@JsonKey(name: 'consentStatus')
          final ConsentStatus? consentStatus}) = _$_Consent;

  factory _Consent.fromJson(Map<String, dynamic> json) = _$_Consent.fromJson;

  @override
  @JsonKey(name: 'consentStatus')
  ConsentStatus? get consentStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ConsentCopyWith<_$_Consent> get copyWith =>
      throw _privateConstructorUsedError;
}
