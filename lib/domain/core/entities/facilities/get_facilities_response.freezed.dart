// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFacilitiesResponse _$GetFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetFacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFacilitiesResponse {
  @JsonKey(name: 'getStaffFacilities')
  LinkedFacilities? get staffLinkedFacilities =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'getClientFacilities')
  LinkedFacilities? get clientLinkedFacilities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFacilitiesResponseCopyWith<GetFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFacilitiesResponseCopyWith<$Res> {
  factory $GetFacilitiesResponseCopyWith(GetFacilitiesResponse value,
          $Res Function(GetFacilitiesResponse) then) =
      _$GetFacilitiesResponseCopyWithImpl<$Res, GetFacilitiesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getStaffFacilities')
          LinkedFacilities? staffLinkedFacilities,
      @JsonKey(name: 'getClientFacilities')
          LinkedFacilities? clientLinkedFacilities});

  $LinkedFacilitiesCopyWith<$Res>? get staffLinkedFacilities;
  $LinkedFacilitiesCopyWith<$Res>? get clientLinkedFacilities;
}

/// @nodoc
class _$GetFacilitiesResponseCopyWithImpl<$Res,
        $Val extends GetFacilitiesResponse>
    implements $GetFacilitiesResponseCopyWith<$Res> {
  _$GetFacilitiesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffLinkedFacilities = freezed,
    Object? clientLinkedFacilities = freezed,
  }) {
    return _then(_value.copyWith(
      staffLinkedFacilities: freezed == staffLinkedFacilities
          ? _value.staffLinkedFacilities
          : staffLinkedFacilities // ignore: cast_nullable_to_non_nullable
              as LinkedFacilities?,
      clientLinkedFacilities: freezed == clientLinkedFacilities
          ? _value.clientLinkedFacilities
          : clientLinkedFacilities // ignore: cast_nullable_to_non_nullable
              as LinkedFacilities?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LinkedFacilitiesCopyWith<$Res>? get staffLinkedFacilities {
    if (_value.staffLinkedFacilities == null) {
      return null;
    }

    return $LinkedFacilitiesCopyWith<$Res>(_value.staffLinkedFacilities!,
        (value) {
      return _then(_value.copyWith(staffLinkedFacilities: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LinkedFacilitiesCopyWith<$Res>? get clientLinkedFacilities {
    if (_value.clientLinkedFacilities == null) {
      return null;
    }

    return $LinkedFacilitiesCopyWith<$Res>(_value.clientLinkedFacilities!,
        (value) {
      return _then(_value.copyWith(clientLinkedFacilities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetFacilitiesResponseCopyWith<$Res>
    implements $GetFacilitiesResponseCopyWith<$Res> {
  factory _$$_GetFacilitiesResponseCopyWith(_$_GetFacilitiesResponse value,
          $Res Function(_$_GetFacilitiesResponse) then) =
      __$$_GetFacilitiesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getStaffFacilities')
          LinkedFacilities? staffLinkedFacilities,
      @JsonKey(name: 'getClientFacilities')
          LinkedFacilities? clientLinkedFacilities});

  @override
  $LinkedFacilitiesCopyWith<$Res>? get staffLinkedFacilities;
  @override
  $LinkedFacilitiesCopyWith<$Res>? get clientLinkedFacilities;
}

/// @nodoc
class __$$_GetFacilitiesResponseCopyWithImpl<$Res>
    extends _$GetFacilitiesResponseCopyWithImpl<$Res, _$_GetFacilitiesResponse>
    implements _$$_GetFacilitiesResponseCopyWith<$Res> {
  __$$_GetFacilitiesResponseCopyWithImpl(_$_GetFacilitiesResponse _value,
      $Res Function(_$_GetFacilitiesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffLinkedFacilities = freezed,
    Object? clientLinkedFacilities = freezed,
  }) {
    return _then(_$_GetFacilitiesResponse(
      staffLinkedFacilities: freezed == staffLinkedFacilities
          ? _value.staffLinkedFacilities
          : staffLinkedFacilities // ignore: cast_nullable_to_non_nullable
              as LinkedFacilities?,
      clientLinkedFacilities: freezed == clientLinkedFacilities
          ? _value.clientLinkedFacilities
          : clientLinkedFacilities // ignore: cast_nullable_to_non_nullable
              as LinkedFacilities?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFacilitiesResponse implements _GetFacilitiesResponse {
  _$_GetFacilitiesResponse(
      {@JsonKey(name: 'getStaffFacilities') this.staffLinkedFacilities,
      @JsonKey(name: 'getClientFacilities') this.clientLinkedFacilities});

  factory _$_GetFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetFacilitiesResponseFromJson(json);

  @override
  @JsonKey(name: 'getStaffFacilities')
  final LinkedFacilities? staffLinkedFacilities;
  @override
  @JsonKey(name: 'getClientFacilities')
  final LinkedFacilities? clientLinkedFacilities;

  @override
  String toString() {
    return 'GetFacilitiesResponse(staffLinkedFacilities: $staffLinkedFacilities, clientLinkedFacilities: $clientLinkedFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFacilitiesResponse &&
            (identical(other.staffLinkedFacilities, staffLinkedFacilities) ||
                other.staffLinkedFacilities == staffLinkedFacilities) &&
            (identical(other.clientLinkedFacilities, clientLinkedFacilities) ||
                other.clientLinkedFacilities == clientLinkedFacilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, staffLinkedFacilities, clientLinkedFacilities);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFacilitiesResponseCopyWith<_$_GetFacilitiesResponse> get copyWith =>
      __$$_GetFacilitiesResponseCopyWithImpl<_$_GetFacilitiesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFacilitiesResponseToJson(
      this,
    );
  }
}

abstract class _GetFacilitiesResponse implements GetFacilitiesResponse {
  factory _GetFacilitiesResponse(
          {@JsonKey(name: 'getStaffFacilities')
              final LinkedFacilities? staffLinkedFacilities,
          @JsonKey(name: 'getClientFacilities')
              final LinkedFacilities? clientLinkedFacilities}) =
      _$_GetFacilitiesResponse;

  factory _GetFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'getStaffFacilities')
  LinkedFacilities? get staffLinkedFacilities;
  @override
  @JsonKey(name: 'getClientFacilities')
  LinkedFacilities? get clientLinkedFacilities;
  @override
  @JsonKey(ignore: true)
  _$$_GetFacilitiesResponseCopyWith<_$_GetFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
