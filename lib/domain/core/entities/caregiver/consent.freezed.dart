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
      _$ConsentCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'consentStatus') ConsentStatus? consentStatus});
}

/// @nodoc
class _$ConsentCopyWithImpl<$Res> implements $ConsentCopyWith<$Res> {
  _$ConsentCopyWithImpl(this._value, this._then);

  final Consent _value;
  // ignore: unused_field
  final $Res Function(Consent) _then;

  @override
  $Res call({
    Object? consentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      consentStatus: consentStatus == freezed
          ? _value.consentStatus
          : consentStatus // ignore: cast_nullable_to_non_nullable
              as ConsentStatus?,
    ));
  }
}

/// @nodoc
abstract class _$$_ConsentCopyWith<$Res> implements $ConsentCopyWith<$Res> {
  factory _$$_ConsentCopyWith(
          _$_Consent value, $Res Function(_$_Consent) then) =
      __$$_ConsentCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'consentStatus') ConsentStatus? consentStatus});
}

/// @nodoc
class __$$_ConsentCopyWithImpl<$Res> extends _$ConsentCopyWithImpl<$Res>
    implements _$$_ConsentCopyWith<$Res> {
  __$$_ConsentCopyWithImpl(_$_Consent _value, $Res Function(_$_Consent) _then)
      : super(_value, (v) => _then(v as _$_Consent));

  @override
  _$_Consent get _value => super._value as _$_Consent;

  @override
  $Res call({
    Object? consentStatus = freezed,
  }) {
    return _then(_$_Consent(
      consentStatus: consentStatus == freezed
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
            const DeepCollectionEquality()
                .equals(other.consentStatus, consentStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(consentStatus));

  @JsonKey(ignore: true)
  @override
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
