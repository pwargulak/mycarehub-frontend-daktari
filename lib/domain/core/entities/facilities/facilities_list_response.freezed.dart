// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facilities_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilitiesListResponse _$FacilitiesListResponseFromJson(
    Map<String, dynamic> json) {
  return _FacilitiesListResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilitiesListResponse {
  @JsonKey(name: 'Facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilitiesListResponseCopyWith<FacilitiesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesListResponseCopyWith<$Res> {
  factory $FacilitiesListResponseCopyWith(FacilitiesListResponse value,
          $Res Function(FacilitiesListResponse) then) =
      _$FacilitiesListResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Facilities') List<Facility>? facilities});
}

/// @nodoc
class _$FacilitiesListResponseCopyWithImpl<$Res>
    implements $FacilitiesListResponseCopyWith<$Res> {
  _$FacilitiesListResponseCopyWithImpl(this._value, this._then);

  final FacilitiesListResponse _value;
  // ignore: unused_field
  final $Res Function(FacilitiesListResponse) _then;

  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_value.copyWith(
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
abstract class _$$_FacilitiesListResponseCopyWith<$Res>
    implements $FacilitiesListResponseCopyWith<$Res> {
  factory _$$_FacilitiesListResponseCopyWith(_$_FacilitiesListResponse value,
          $Res Function(_$_FacilitiesListResponse) then) =
      __$$_FacilitiesListResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Facilities') List<Facility>? facilities});
}

/// @nodoc
class __$$_FacilitiesListResponseCopyWithImpl<$Res>
    extends _$FacilitiesListResponseCopyWithImpl<$Res>
    implements _$$_FacilitiesListResponseCopyWith<$Res> {
  __$$_FacilitiesListResponseCopyWithImpl(_$_FacilitiesListResponse _value,
      $Res Function(_$_FacilitiesListResponse) _then)
      : super(_value, (v) => _then(v as _$_FacilitiesListResponse));

  @override
  _$_FacilitiesListResponse get _value =>
      super._value as _$_FacilitiesListResponse;

  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_$_FacilitiesListResponse(
      facilities: facilities == freezed
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilitiesListResponse implements _FacilitiesListResponse {
  _$_FacilitiesListResponse(
      {@JsonKey(name: 'Facilities') final List<Facility>? facilities})
      : _facilities = facilities;

  factory _$_FacilitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FacilitiesListResponseFromJson(json);

  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'Facilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FacilitiesListResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilitiesListResponse &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
  _$$_FacilitiesListResponseCopyWith<_$_FacilitiesListResponse> get copyWith =>
      __$$_FacilitiesListResponseCopyWithImpl<_$_FacilitiesListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilitiesListResponseToJson(
      this,
    );
  }
}

abstract class _FacilitiesListResponse implements FacilitiesListResponse {
  factory _FacilitiesListResponse(
          {@JsonKey(name: 'Facilities') final List<Facility>? facilities}) =
      _$_FacilitiesListResponse;

  factory _FacilitiesListResponse.fromJson(Map<String, dynamic> json) =
      _$_FacilitiesListResponse.fromJson;

  @override
  @JsonKey(name: 'Facilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$$_FacilitiesListResponseCopyWith<_$_FacilitiesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
