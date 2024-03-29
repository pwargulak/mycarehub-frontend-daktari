// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_user_program_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetUserProgramResponse _$SetUserProgramResponseFromJson(
    Map<String, dynamic> json) {
  return _SetUserProgramResponse.fromJson(json);
}

/// @nodoc
mixin _$SetUserProgramResponse {
  @JsonKey(name: 'staffProfile')
  StaffProfileResponse? get staffProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'communityToken')
  String? get communityToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetUserProgramResponseCopyWith<SetUserProgramResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetUserProgramResponseCopyWith<$Res> {
  factory $SetUserProgramResponseCopyWith(SetUserProgramResponse value,
          $Res Function(SetUserProgramResponse) then) =
      _$SetUserProgramResponseCopyWithImpl<$Res, SetUserProgramResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'staffProfile') StaffProfileResponse? staffProfile,
      @JsonKey(name: 'communityToken') String? communityToken});

  $StaffProfileResponseCopyWith<$Res>? get staffProfile;
}

/// @nodoc
class _$SetUserProgramResponseCopyWithImpl<$Res,
        $Val extends SetUserProgramResponse>
    implements $SetUserProgramResponseCopyWith<$Res> {
  _$SetUserProgramResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffProfile = freezed,
    Object? communityToken = freezed,
  }) {
    return _then(_value.copyWith(
      staffProfile: freezed == staffProfile
          ? _value.staffProfile
          : staffProfile // ignore: cast_nullable_to_non_nullable
              as StaffProfileResponse?,
      communityToken: freezed == communityToken
          ? _value.communityToken
          : communityToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StaffProfileResponseCopyWith<$Res>? get staffProfile {
    if (_value.staffProfile == null) {
      return null;
    }

    return $StaffProfileResponseCopyWith<$Res>(_value.staffProfile!, (value) {
      return _then(_value.copyWith(staffProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SetUserProgramResponseCopyWith<$Res>
    implements $SetUserProgramResponseCopyWith<$Res> {
  factory _$$_SetUserProgramResponseCopyWith(_$_SetUserProgramResponse value,
          $Res Function(_$_SetUserProgramResponse) then) =
      __$$_SetUserProgramResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'staffProfile') StaffProfileResponse? staffProfile,
      @JsonKey(name: 'communityToken') String? communityToken});

  @override
  $StaffProfileResponseCopyWith<$Res>? get staffProfile;
}

/// @nodoc
class __$$_SetUserProgramResponseCopyWithImpl<$Res>
    extends _$SetUserProgramResponseCopyWithImpl<$Res,
        _$_SetUserProgramResponse>
    implements _$$_SetUserProgramResponseCopyWith<$Res> {
  __$$_SetUserProgramResponseCopyWithImpl(_$_SetUserProgramResponse _value,
      $Res Function(_$_SetUserProgramResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffProfile = freezed,
    Object? communityToken = freezed,
  }) {
    return _then(_$_SetUserProgramResponse(
      staffProfile: freezed == staffProfile
          ? _value.staffProfile
          : staffProfile // ignore: cast_nullable_to_non_nullable
              as StaffProfileResponse?,
      communityToken: freezed == communityToken
          ? _value.communityToken
          : communityToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetUserProgramResponse implements _SetUserProgramResponse {
  _$_SetUserProgramResponse(
      {@JsonKey(name: 'staffProfile') this.staffProfile,
      @JsonKey(name: 'communityToken') this.communityToken});

  factory _$_SetUserProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SetUserProgramResponseFromJson(json);

  @override
  @JsonKey(name: 'staffProfile')
  final StaffProfileResponse? staffProfile;
  @override
  @JsonKey(name: 'communityToken')
  final String? communityToken;

  @override
  String toString() {
    return 'SetUserProgramResponse(staffProfile: $staffProfile, communityToken: $communityToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetUserProgramResponse &&
            (identical(other.staffProfile, staffProfile) ||
                other.staffProfile == staffProfile) &&
            (identical(other.communityToken, communityToken) ||
                other.communityToken == communityToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, staffProfile, communityToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetUserProgramResponseCopyWith<_$_SetUserProgramResponse> get copyWith =>
      __$$_SetUserProgramResponseCopyWithImpl<_$_SetUserProgramResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetUserProgramResponseToJson(
      this,
    );
  }
}

abstract class _SetUserProgramResponse implements SetUserProgramResponse {
  factory _SetUserProgramResponse(
      {@JsonKey(name: 'staffProfile')
          final StaffProfileResponse? staffProfile,
      @JsonKey(name: 'communityToken')
          final String? communityToken}) = _$_SetUserProgramResponse;

  factory _SetUserProgramResponse.fromJson(Map<String, dynamic> json) =
      _$_SetUserProgramResponse.fromJson;

  @override
  @JsonKey(name: 'staffProfile')
  StaffProfileResponse? get staffProfile;
  @override
  @JsonKey(name: 'communityToken')
  String? get communityToken;
  @override
  @JsonKey(ignore: true)
  _$$_SetUserProgramResponseCopyWith<_$_SetUserProgramResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
