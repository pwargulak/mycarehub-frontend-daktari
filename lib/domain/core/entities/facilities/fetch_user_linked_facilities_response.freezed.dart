// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_user_linked_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchUserLinkedFacilitiesResponse _$FetchUserLinkedFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _FetchUserLinkedFacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchUserLinkedFacilitiesResponse {
  @JsonKey(name: 'getUserLinkedFacilities')
  FacilitiesListResponse? get facilitiesListResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchUserLinkedFacilitiesResponseCopyWith<FetchUserLinkedFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUserLinkedFacilitiesResponseCopyWith<$Res> {
  factory $FetchUserLinkedFacilitiesResponseCopyWith(
          FetchUserLinkedFacilitiesResponse value,
          $Res Function(FetchUserLinkedFacilitiesResponse) then) =
      _$FetchUserLinkedFacilitiesResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getUserLinkedFacilities')
          FacilitiesListResponse? facilitiesListResponse});

  $FacilitiesListResponseCopyWith<$Res>? get facilitiesListResponse;
}

/// @nodoc
class _$FetchUserLinkedFacilitiesResponseCopyWithImpl<$Res>
    implements $FetchUserLinkedFacilitiesResponseCopyWith<$Res> {
  _$FetchUserLinkedFacilitiesResponseCopyWithImpl(this._value, this._then);

  final FetchUserLinkedFacilitiesResponse _value;
  // ignore: unused_field
  final $Res Function(FetchUserLinkedFacilitiesResponse) _then;

  @override
  $Res call({
    Object? facilitiesListResponse = freezed,
  }) {
    return _then(_value.copyWith(
      facilitiesListResponse: facilitiesListResponse == freezed
          ? _value.facilitiesListResponse
          : facilitiesListResponse // ignore: cast_nullable_to_non_nullable
              as FacilitiesListResponse?,
    ));
  }

  @override
  $FacilitiesListResponseCopyWith<$Res>? get facilitiesListResponse {
    if (_value.facilitiesListResponse == null) {
      return null;
    }

    return $FacilitiesListResponseCopyWith<$Res>(_value.facilitiesListResponse!,
        (value) {
      return _then(_value.copyWith(facilitiesListResponse: value));
    });
  }
}

/// @nodoc
abstract class _$$_FetchUserLinkedFacilitiesResponseCopyWith<$Res>
    implements $FetchUserLinkedFacilitiesResponseCopyWith<$Res> {
  factory _$$_FetchUserLinkedFacilitiesResponseCopyWith(
          _$_FetchUserLinkedFacilitiesResponse value,
          $Res Function(_$_FetchUserLinkedFacilitiesResponse) then) =
      __$$_FetchUserLinkedFacilitiesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getUserLinkedFacilities')
          FacilitiesListResponse? facilitiesListResponse});

  @override
  $FacilitiesListResponseCopyWith<$Res>? get facilitiesListResponse;
}

/// @nodoc
class __$$_FetchUserLinkedFacilitiesResponseCopyWithImpl<$Res>
    extends _$FetchUserLinkedFacilitiesResponseCopyWithImpl<$Res>
    implements _$$_FetchUserLinkedFacilitiesResponseCopyWith<$Res> {
  __$$_FetchUserLinkedFacilitiesResponseCopyWithImpl(
      _$_FetchUserLinkedFacilitiesResponse _value,
      $Res Function(_$_FetchUserLinkedFacilitiesResponse) _then)
      : super(_value, (v) => _then(v as _$_FetchUserLinkedFacilitiesResponse));

  @override
  _$_FetchUserLinkedFacilitiesResponse get _value =>
      super._value as _$_FetchUserLinkedFacilitiesResponse;

  @override
  $Res call({
    Object? facilitiesListResponse = freezed,
  }) {
    return _then(_$_FetchUserLinkedFacilitiesResponse(
      facilitiesListResponse: facilitiesListResponse == freezed
          ? _value.facilitiesListResponse
          : facilitiesListResponse // ignore: cast_nullable_to_non_nullable
              as FacilitiesListResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchUserLinkedFacilitiesResponse
    implements _FetchUserLinkedFacilitiesResponse {
  _$_FetchUserLinkedFacilitiesResponse(
      {@JsonKey(name: 'getUserLinkedFacilities') this.facilitiesListResponse});

  factory _$_FetchUserLinkedFacilitiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_FetchUserLinkedFacilitiesResponseFromJson(json);

  @override
  @JsonKey(name: 'getUserLinkedFacilities')
  final FacilitiesListResponse? facilitiesListResponse;

  @override
  String toString() {
    return 'FetchUserLinkedFacilitiesResponse(facilitiesListResponse: $facilitiesListResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchUserLinkedFacilitiesResponse &&
            const DeepCollectionEquality()
                .equals(other.facilitiesListResponse, facilitiesListResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(facilitiesListResponse));

  @JsonKey(ignore: true)
  @override
  _$$_FetchUserLinkedFacilitiesResponseCopyWith<
          _$_FetchUserLinkedFacilitiesResponse>
      get copyWith => __$$_FetchUserLinkedFacilitiesResponseCopyWithImpl<
          _$_FetchUserLinkedFacilitiesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchUserLinkedFacilitiesResponseToJson(
      this,
    );
  }
}

abstract class _FetchUserLinkedFacilitiesResponse
    implements FetchUserLinkedFacilitiesResponse {
  factory _FetchUserLinkedFacilitiesResponse(
          {@JsonKey(name: 'getUserLinkedFacilities')
              final FacilitiesListResponse? facilitiesListResponse}) =
      _$_FetchUserLinkedFacilitiesResponse;

  factory _FetchUserLinkedFacilitiesResponse.fromJson(
          Map<String, dynamic> json) =
      _$_FetchUserLinkedFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'getUserLinkedFacilities')
  FacilitiesListResponse? get facilitiesListResponse;
  @override
  @JsonKey(ignore: true)
  _$$_FetchUserLinkedFacilitiesResponseCopyWith<
          _$_FetchUserLinkedFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
