// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncState _$SyncStateFromJson(Map<String, dynamic> json) {
  return _SyncState.fromJson(json);
}

/// @nodoc
mixin _$SyncState {
  /// Milliseconds
  @JsonKey(name: 'syncInterval')
  int? get syncInterval => throw _privateConstructorUsedError;

  /// Milliseconds
  @JsonKey(name: 'syncPollTimeout')
  int? get syncPollTimeout => throw _privateConstructorUsedError;

  /// Last timestamp for actual new info
  @JsonKey(name: 'lastUpdate')
  int? get lastUpdate => throw _privateConstructorUsedError;

  /// last attempt to sync
  @JsonKey(name: 'lastAttempt')
  int? get lastAttempt => throw _privateConstructorUsedError;

  /// Since we last checked for new info
  @JsonKey(name: 'lastSince')
  String? get lastSince => throw _privateConstructorUsedError;

  /// A timer we will use to poll
  @JsonKey(name: 'syncObserver', ignore: true)
  Timer? get syncObserver =>
      throw _privateConstructorUsedError; // Backoff value
  @JsonKey(name: 'backOff')
  int? get backOff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncStateCopyWith<SyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'syncInterval') int? syncInterval,
      @JsonKey(name: 'syncPollTimeout') int? syncPollTimeout,
      @JsonKey(name: 'lastUpdate') int? lastUpdate,
      @JsonKey(name: 'lastAttempt') int? lastAttempt,
      @JsonKey(name: 'lastSince') String? lastSince,
      @JsonKey(name: 'syncObserver', ignore: true) Timer? syncObserver,
      @JsonKey(name: 'backOff') int? backOff});
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res> implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

  final SyncState _value;
  // ignore: unused_field
  final $Res Function(SyncState) _then;

  @override
  $Res call({
    Object? syncInterval = freezed,
    Object? syncPollTimeout = freezed,
    Object? lastUpdate = freezed,
    Object? lastAttempt = freezed,
    Object? lastSince = freezed,
    Object? syncObserver = freezed,
    Object? backOff = freezed,
  }) {
    return _then(_value.copyWith(
      syncInterval: syncInterval == freezed
          ? _value.syncInterval
          : syncInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      syncPollTimeout: syncPollTimeout == freezed
          ? _value.syncPollTimeout
          : syncPollTimeout // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttempt: lastAttempt == freezed
          ? _value.lastAttempt
          : lastAttempt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSince: lastSince == freezed
          ? _value.lastSince
          : lastSince // ignore: cast_nullable_to_non_nullable
              as String?,
      syncObserver: syncObserver == freezed
          ? _value.syncObserver
          : syncObserver // ignore: cast_nullable_to_non_nullable
              as Timer?,
      backOff: backOff == freezed
          ? _value.backOff
          : backOff // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_SyncStateCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory _$$_SyncStateCopyWith(
          _$_SyncState value, $Res Function(_$_SyncState) then) =
      __$$_SyncStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'syncInterval') int? syncInterval,
      @JsonKey(name: 'syncPollTimeout') int? syncPollTimeout,
      @JsonKey(name: 'lastUpdate') int? lastUpdate,
      @JsonKey(name: 'lastAttempt') int? lastAttempt,
      @JsonKey(name: 'lastSince') String? lastSince,
      @JsonKey(name: 'syncObserver', ignore: true) Timer? syncObserver,
      @JsonKey(name: 'backOff') int? backOff});
}

/// @nodoc
class __$$_SyncStateCopyWithImpl<$Res> extends _$SyncStateCopyWithImpl<$Res>
    implements _$$_SyncStateCopyWith<$Res> {
  __$$_SyncStateCopyWithImpl(
      _$_SyncState _value, $Res Function(_$_SyncState) _then)
      : super(_value, (v) => _then(v as _$_SyncState));

  @override
  _$_SyncState get _value => super._value as _$_SyncState;

  @override
  $Res call({
    Object? syncInterval = freezed,
    Object? syncPollTimeout = freezed,
    Object? lastUpdate = freezed,
    Object? lastAttempt = freezed,
    Object? lastSince = freezed,
    Object? syncObserver = freezed,
    Object? backOff = freezed,
  }) {
    return _then(_$_SyncState(
      syncInterval: syncInterval == freezed
          ? _value.syncInterval
          : syncInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      syncPollTimeout: syncPollTimeout == freezed
          ? _value.syncPollTimeout
          : syncPollTimeout // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttempt: lastAttempt == freezed
          ? _value.lastAttempt
          : lastAttempt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSince: lastSince == freezed
          ? _value.lastSince
          : lastSince // ignore: cast_nullable_to_non_nullable
              as String?,
      syncObserver: syncObserver == freezed
          ? _value.syncObserver
          : syncObserver // ignore: cast_nullable_to_non_nullable
              as Timer?,
      backOff: backOff == freezed
          ? _value.backOff
          : backOff // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncState implements _SyncState {
  _$_SyncState(
      {@JsonKey(name: 'syncInterval') this.syncInterval,
      @JsonKey(name: 'syncPollTimeout') this.syncPollTimeout,
      @JsonKey(name: 'lastUpdate') this.lastUpdate,
      @JsonKey(name: 'lastAttempt') this.lastAttempt,
      @JsonKey(name: 'lastSince') this.lastSince,
      @JsonKey(name: 'syncObserver', ignore: true) this.syncObserver,
      @JsonKey(name: 'backOff') this.backOff});

  factory _$_SyncState.fromJson(Map<String, dynamic> json) =>
      _$$_SyncStateFromJson(json);

  /// Milliseconds
  @override
  @JsonKey(name: 'syncInterval')
  final int? syncInterval;

  /// Milliseconds
  @override
  @JsonKey(name: 'syncPollTimeout')
  final int? syncPollTimeout;

  /// Last timestamp for actual new info
  @override
  @JsonKey(name: 'lastUpdate')
  final int? lastUpdate;

  /// last attempt to sync
  @override
  @JsonKey(name: 'lastAttempt')
  final int? lastAttempt;

  /// Since we last checked for new info
  @override
  @JsonKey(name: 'lastSince')
  final String? lastSince;

  /// A timer we will use to poll
  @override
  @JsonKey(name: 'syncObserver', ignore: true)
  final Timer? syncObserver;
// Backoff value
  @override
  @JsonKey(name: 'backOff')
  final int? backOff;

  @override
  String toString() {
    return 'SyncState(syncInterval: $syncInterval, syncPollTimeout: $syncPollTimeout, lastUpdate: $lastUpdate, lastAttempt: $lastAttempt, lastSince: $lastSince, syncObserver: $syncObserver, backOff: $backOff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncState &&
            const DeepCollectionEquality()
                .equals(other.syncInterval, syncInterval) &&
            const DeepCollectionEquality()
                .equals(other.syncPollTimeout, syncPollTimeout) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate) &&
            const DeepCollectionEquality()
                .equals(other.lastAttempt, lastAttempt) &&
            const DeepCollectionEquality().equals(other.lastSince, lastSince) &&
            const DeepCollectionEquality()
                .equals(other.syncObserver, syncObserver) &&
            const DeepCollectionEquality().equals(other.backOff, backOff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(syncInterval),
      const DeepCollectionEquality().hash(syncPollTimeout),
      const DeepCollectionEquality().hash(lastUpdate),
      const DeepCollectionEquality().hash(lastAttempt),
      const DeepCollectionEquality().hash(lastSince),
      const DeepCollectionEquality().hash(syncObserver),
      const DeepCollectionEquality().hash(backOff));

  @JsonKey(ignore: true)
  @override
  _$$_SyncStateCopyWith<_$_SyncState> get copyWith =>
      __$$_SyncStateCopyWithImpl<_$_SyncState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncStateToJson(
      this,
    );
  }
}

abstract class _SyncState implements SyncState {
  factory _SyncState(
      {@JsonKey(name: 'syncInterval') final int? syncInterval,
      @JsonKey(name: 'syncPollTimeout') final int? syncPollTimeout,
      @JsonKey(name: 'lastUpdate') final int? lastUpdate,
      @JsonKey(name: 'lastAttempt') final int? lastAttempt,
      @JsonKey(name: 'lastSince') final String? lastSince,
      @JsonKey(name: 'syncObserver', ignore: true) final Timer? syncObserver,
      @JsonKey(name: 'backOff') final int? backOff}) = _$_SyncState;

  factory _SyncState.fromJson(Map<String, dynamic> json) =
      _$_SyncState.fromJson;

  @override

  /// Milliseconds
  @JsonKey(name: 'syncInterval')
  int? get syncInterval;
  @override

  /// Milliseconds
  @JsonKey(name: 'syncPollTimeout')
  int? get syncPollTimeout;
  @override

  /// Last timestamp for actual new info
  @JsonKey(name: 'lastUpdate')
  int? get lastUpdate;
  @override

  /// last attempt to sync
  @JsonKey(name: 'lastAttempt')
  int? get lastAttempt;
  @override

  /// Since we last checked for new info
  @JsonKey(name: 'lastSince')
  String? get lastSince;
  @override

  /// A timer we will use to poll
  @JsonKey(name: 'syncObserver', ignore: true)
  Timer? get syncObserver;
  @override // Backoff value
  @JsonKey(name: 'backOff')
  int? get backOff;
  @override
  @JsonKey(ignore: true)
  _$$_SyncStateCopyWith<_$_SyncState> get copyWith =>
      throw _privateConstructorUsedError;
}
