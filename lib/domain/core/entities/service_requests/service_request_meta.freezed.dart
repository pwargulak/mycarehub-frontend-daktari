// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestMeta _$ServiceRequestMetaFromJson(Map<String, dynamic> json) {
  return _ServiceRequestMeta.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestMeta {
  @JsonKey(name: 'ccc_number')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ccc_number_valid')
  bool? get isCccNumberValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestMetaCopyWith<ServiceRequestMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestMetaCopyWith<$Res> {
  factory $ServiceRequestMetaCopyWith(
          ServiceRequestMeta value, $Res Function(ServiceRequestMeta) then) =
      _$ServiceRequestMetaCopyWithImpl<$Res, ServiceRequestMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ccc_number') String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') bool? isCccNumberValid,
      @JsonKey(name: 'note') String? note});
}

/// @nodoc
class _$ServiceRequestMetaCopyWithImpl<$Res, $Val extends ServiceRequestMeta>
    implements $ServiceRequestMetaCopyWith<$Res> {
  _$ServiceRequestMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cccNumber = freezed,
    Object? isCccNumberValid = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isCccNumberValid: freezed == isCccNumberValid
          ? _value.isCccNumberValid
          : isCccNumberValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceRequestMetaCopyWith<$Res>
    implements $ServiceRequestMetaCopyWith<$Res> {
  factory _$$_ServiceRequestMetaCopyWith(_$_ServiceRequestMeta value,
          $Res Function(_$_ServiceRequestMeta) then) =
      __$$_ServiceRequestMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ccc_number') String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') bool? isCccNumberValid,
      @JsonKey(name: 'note') String? note});
}

/// @nodoc
class __$$_ServiceRequestMetaCopyWithImpl<$Res>
    extends _$ServiceRequestMetaCopyWithImpl<$Res, _$_ServiceRequestMeta>
    implements _$$_ServiceRequestMetaCopyWith<$Res> {
  __$$_ServiceRequestMetaCopyWithImpl(
      _$_ServiceRequestMeta _value, $Res Function(_$_ServiceRequestMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cccNumber = freezed,
    Object? isCccNumberValid = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_ServiceRequestMeta(
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isCccNumberValid: freezed == isCccNumberValid
          ? _value.isCccNumberValid
          : isCccNumberValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestMeta implements _ServiceRequestMeta {
  _$_ServiceRequestMeta(
      {@JsonKey(name: 'ccc_number') this.cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') this.isCccNumberValid,
      @JsonKey(name: 'note') this.note});

  factory _$_ServiceRequestMeta.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestMetaFromJson(json);

  @override
  @JsonKey(name: 'ccc_number')
  final String? cccNumber;
  @override
  @JsonKey(name: 'is_ccc_number_valid')
  final bool? isCccNumberValid;
  @override
  @JsonKey(name: 'note')
  final String? note;

  @override
  String toString() {
    return 'ServiceRequestMeta(cccNumber: $cccNumber, isCccNumberValid: $isCccNumberValid, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestMeta &&
            (identical(other.cccNumber, cccNumber) ||
                other.cccNumber == cccNumber) &&
            (identical(other.isCccNumberValid, isCccNumberValid) ||
                other.isCccNumberValid == isCccNumberValid) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cccNumber, isCccNumberValid, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestMetaCopyWith<_$_ServiceRequestMeta> get copyWith =>
      __$$_ServiceRequestMetaCopyWithImpl<_$_ServiceRequestMeta>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestMetaToJson(
      this,
    );
  }
}

abstract class _ServiceRequestMeta implements ServiceRequestMeta {
  factory _ServiceRequestMeta(
      {@JsonKey(name: 'ccc_number') final String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') final bool? isCccNumberValid,
      @JsonKey(name: 'note') final String? note}) = _$_ServiceRequestMeta;

  factory _ServiceRequestMeta.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestMeta.fromJson;

  @override
  @JsonKey(name: 'ccc_number')
  String? get cccNumber;
  @override
  @JsonKey(name: 'is_ccc_number_valid')
  bool? get isCccNumberValid;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestMetaCopyWith<_$_ServiceRequestMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
