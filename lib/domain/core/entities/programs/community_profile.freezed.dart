// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityProfile _$CommunityProfileFromJson(Map<String, dynamic> json) {
  return _CommunityProfile.fromJson(json);
}

/// @nodoc
mixin _$CommunityProfile {
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'accessToken')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceID')
  String? get deviceID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityProfileCopyWith<CommunityProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityProfileCopyWith<$Res> {
  factory $CommunityProfileCopyWith(
          CommunityProfile value, $Res Function(CommunityProfile) then) =
      _$CommunityProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'accessToken') String? accessToken,
      @JsonKey(name: 'deviceID') String? deviceID});
}

/// @nodoc
class _$CommunityProfileCopyWithImpl<$Res>
    implements $CommunityProfileCopyWith<$Res> {
  _$CommunityProfileCopyWithImpl(this._value, this._then);

  final CommunityProfile _value;
  // ignore: unused_field
  final $Res Function(CommunityProfile) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? accessToken = freezed,
    Object? deviceID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceID: deviceID == freezed
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CommunityProfileCopyWith<$Res>
    implements $CommunityProfileCopyWith<$Res> {
  factory _$$_CommunityProfileCopyWith(
          _$_CommunityProfile value, $Res Function(_$_CommunityProfile) then) =
      __$$_CommunityProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'accessToken') String? accessToken,
      @JsonKey(name: 'deviceID') String? deviceID});
}

/// @nodoc
class __$$_CommunityProfileCopyWithImpl<$Res>
    extends _$CommunityProfileCopyWithImpl<$Res>
    implements _$$_CommunityProfileCopyWith<$Res> {
  __$$_CommunityProfileCopyWithImpl(
      _$_CommunityProfile _value, $Res Function(_$_CommunityProfile) _then)
      : super(_value, (v) => _then(v as _$_CommunityProfile));

  @override
  _$_CommunityProfile get _value => super._value as _$_CommunityProfile;

  @override
  $Res call({
    Object? userID = freezed,
    Object? accessToken = freezed,
    Object? deviceID = freezed,
  }) {
    return _then(_$_CommunityProfile(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceID: deviceID == freezed
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommunityProfile implements _CommunityProfile {
  _$_CommunityProfile(
      {@JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'accessToken') this.accessToken,
      @JsonKey(name: 'deviceID') this.deviceID});

  factory _$_CommunityProfile.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityProfileFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @override
  @JsonKey(name: 'deviceID')
  final String? deviceID;

  @override
  String toString() {
    return 'CommunityProfile(userID: $userID, accessToken: $accessToken, deviceID: $deviceID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunityProfile &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality().equals(other.deviceID, deviceID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(deviceID));

  @JsonKey(ignore: true)
  @override
  _$$_CommunityProfileCopyWith<_$_CommunityProfile> get copyWith =>
      __$$_CommunityProfileCopyWithImpl<_$_CommunityProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityProfileToJson(
      this,
    );
  }
}

abstract class _CommunityProfile implements CommunityProfile {
  factory _CommunityProfile(
      {@JsonKey(name: 'userID') final String? userID,
      @JsonKey(name: 'accessToken') final String? accessToken,
      @JsonKey(name: 'deviceID') final String? deviceID}) = _$_CommunityProfile;

  factory _CommunityProfile.fromJson(Map<String, dynamic> json) =
      _$_CommunityProfile.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userID;
  @override
  @JsonKey(name: 'accessToken')
  String? get accessToken;
  @override
  @JsonKey(name: 'deviceID')
  String? get deviceID;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityProfileCopyWith<_$_CommunityProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
