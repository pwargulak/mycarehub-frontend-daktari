// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
class _$MiscStateTearOff {
  const _$MiscStateTearOff();

  _MiscState call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime}) {
    return _MiscState(
      initialRoute: initialRoute,
      error: error,
      profileFAQsContentState: profileFAQsContentState,
      communityMembers: communityMembers,
      groupState: groupState,
      searchUserResponseState: searchUserResponseState,
      inactiveTime: inactiveTime,
    );
  }

  MiscState fromJson(Map<String, Object?> json) {
    return MiscState.fromJson(json);
  }
}

/// @nodoc
const $MiscState = _$MiscStateTearOff();

/// @nodoc
mixin _$MiscState {
  String? get initialRoute => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  FAQsContentState? get profileFAQsContentState =>
      throw _privateConstructorUsedError;
  List<Member>? get communityMembers => throw _privateConstructorUsedError;
  GroupState? get groupState => throw _privateConstructorUsedError;
  SearchUserResponseState? get searchUserResponseState =>
      throw _privateConstructorUsedError;
  String? get inactiveTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime});

  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  $GroupStateCopyWith<$Res>? get groupState;
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? communityMembers = freezed,
    Object? groupState = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      communityMembers: communityMembers == freezed
          ? _value.communityMembers
          : communityMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      groupState: groupState == freezed
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      searchUserResponseState: searchUserResponseState == freezed
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState {
    if (_value.profileFAQsContentState == null) {
      return null;
    }

    return $FAQsContentStateCopyWith<$Res>(_value.profileFAQsContentState!,
        (value) {
      return _then(_value.copyWith(profileFAQsContentState: value));
    });
  }

  @override
  $GroupStateCopyWith<$Res>? get groupState {
    if (_value.groupState == null) {
      return null;
    }

    return $GroupStateCopyWith<$Res>(_value.groupState!, (value) {
      return _then(_value.copyWith(groupState: value));
    });
  }

  @override
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState {
    if (_value.searchUserResponseState == null) {
      return null;
    }

    return $SearchUserResponseStateCopyWith<$Res>(
        _value.searchUserResponseState!, (value) {
      return _then(_value.copyWith(searchUserResponseState: value));
    });
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime});

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  @override
  $GroupStateCopyWith<$Res>? get groupState;
  @override
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
}

/// @nodoc
class __$MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$MiscStateCopyWith<$Res> {
  __$MiscStateCopyWithImpl(_MiscState _value, $Res Function(_MiscState) _then)
      : super(_value, (v) => _then(v as _MiscState));

  @override
  _MiscState get _value => super._value as _MiscState;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? communityMembers = freezed,
    Object? groupState = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
  }) {
    return _then(_MiscState(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      communityMembers: communityMembers == freezed
          ? _value.communityMembers
          : communityMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      groupState: groupState == freezed
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      searchUserResponseState: searchUserResponseState == freezed
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.initialRoute,
      this.error,
      this.profileFAQsContentState,
      this.communityMembers,
      this.groupState,
      this.searchUserResponseState,
      this.inactiveTime});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  final String? initialRoute;
  @override
  final String? error;
  @override
  final FAQsContentState? profileFAQsContentState;
  @override
  final List<Member>? communityMembers;
  @override
  final GroupState? groupState;
  @override
  final SearchUserResponseState? searchUserResponseState;
  @override
  final String? inactiveTime;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, error: $error, profileFAQsContentState: $profileFAQsContentState, communityMembers: $communityMembers, groupState: $groupState, searchUserResponseState: $searchUserResponseState, inactiveTime: $inactiveTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MiscState &&
            const DeepCollectionEquality()
                .equals(other.initialRoute, initialRoute) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(
                other.profileFAQsContentState, profileFAQsContentState) &&
            const DeepCollectionEquality()
                .equals(other.communityMembers, communityMembers) &&
            const DeepCollectionEquality()
                .equals(other.groupState, groupState) &&
            const DeepCollectionEquality().equals(
                other.searchUserResponseState, searchUserResponseState) &&
            const DeepCollectionEquality()
                .equals(other.inactiveTime, inactiveTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialRoute),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(profileFAQsContentState),
      const DeepCollectionEquality().hash(communityMembers),
      const DeepCollectionEquality().hash(groupState),
      const DeepCollectionEquality().hash(searchUserResponseState),
      const DeepCollectionEquality().hash(inactiveTime));

  @JsonKey(ignore: true)
  @override
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      __$MiscStateCopyWithImpl<_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiscStateToJson(this);
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get initialRoute;
  @override
  String? get error;
  @override
  FAQsContentState? get profileFAQsContentState;
  @override
  List<Member>? get communityMembers;
  @override
  GroupState? get groupState;
  @override
  SearchUserResponseState? get searchUserResponseState;
  @override
  String? get inactiveTime;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
