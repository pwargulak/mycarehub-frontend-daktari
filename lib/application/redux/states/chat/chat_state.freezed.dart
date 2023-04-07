// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  return _ChatState.fromJson(json);
}

/// @nodoc
mixin _$ChatState {
  @JsonKey(name: 'userProfile')
  User? get userProfile => throw _privateConstructorUsedError;

  /// Stores a group's members
  @JsonKey(name: 'groupInfoMembers')
  List<RoomUser>? get groupInfoMembers => throw _privateConstructorUsedError;

  /// Stores results for searching members
  @JsonKey(name: 'searchMemberResults')
  List<User>? get searchMemberResults =>
      throw _privateConstructorUsedError; // A list of banned users
  @JsonKey(name: 'bannedUserIDs')
  List<String?>? get bannedUserIDs => throw _privateConstructorUsedError;

  /// A list for flagged message events
  @JsonKey(name: 'flagged_message_events')
  List<EventReport?>? get flaggedMessageEvents =>
      throw _privateConstructorUsedError; // Final string lastSyncTime for chats
  @JsonKey(name: 'lastSyncTime')
  String? get lastSyncTime =>
      throw _privateConstructorUsedError; // Specific for rooms
  @JsonKey(name: 'syncResponse')
  SyncResponse? get syncResponse =>
      throw _privateConstructorUsedError; // Specific for the sync observer settings
  @JsonKey(name: 'syncState')
  SyncState? get syncState =>
      throw _privateConstructorUsedError; // The currently selected room
  @JsonKey(name: 'selectedRoom')
  String? get selectedRoom => throw _privateConstructorUsedError;

  /// The flagged message being viewed
  @JsonKey(name: 'selected_flagged_message')
  EventReport? get selectedFlaggedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userProfile')
          User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          List<User>? searchMemberResults,
      @JsonKey(name: 'bannedUserIDs')
          List<String?>? bannedUserIDs,
      @JsonKey(name: 'flagged_message_events')
          List<EventReport?>? flaggedMessageEvents,
      @JsonKey(name: 'lastSyncTime')
          String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          SyncState? syncState,
      @JsonKey(name: 'selectedRoom')
          String? selectedRoom,
      @JsonKey(name: 'selected_flagged_message')
          EventReport? selectedFlaggedMessage});

  $UserCopyWith<$Res>? get userProfile;
  $SyncResponseCopyWith<$Res>? get syncResponse;
  $SyncStateCopyWith<$Res>? get syncState;
  $EventReportCopyWith<$Res>? get selectedFlaggedMessage;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? groupInfoMembers = freezed,
    Object? searchMemberResults = freezed,
    Object? bannedUserIDs = freezed,
    Object? flaggedMessageEvents = freezed,
    Object? lastSyncTime = freezed,
    Object? syncResponse = freezed,
    Object? syncState = freezed,
    Object? selectedRoom = freezed,
    Object? selectedFlaggedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
      groupInfoMembers: groupInfoMembers == freezed
          ? _value.groupInfoMembers
          : groupInfoMembers // ignore: cast_nullable_to_non_nullable
              as List<RoomUser>?,
      searchMemberResults: searchMemberResults == freezed
          ? _value.searchMemberResults
          : searchMemberResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      bannedUserIDs: bannedUserIDs == freezed
          ? _value.bannedUserIDs
          : bannedUserIDs // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      flaggedMessageEvents: flaggedMessageEvents == freezed
          ? _value.flaggedMessageEvents
          : flaggedMessageEvents // ignore: cast_nullable_to_non_nullable
              as List<EventReport?>?,
      lastSyncTime: lastSyncTime == freezed
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      syncResponse: syncResponse == freezed
          ? _value.syncResponse
          : syncResponse // ignore: cast_nullable_to_non_nullable
              as SyncResponse?,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as SyncState?,
      selectedRoom: selectedRoom == freezed
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedFlaggedMessage: selectedFlaggedMessage == freezed
          ? _value.selectedFlaggedMessage
          : selectedFlaggedMessage // ignore: cast_nullable_to_non_nullable
              as EventReport?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }

  @override
  $SyncResponseCopyWith<$Res>? get syncResponse {
    if (_value.syncResponse == null) {
      return null;
    }

    return $SyncResponseCopyWith<$Res>(_value.syncResponse!, (value) {
      return _then(_value.copyWith(syncResponse: value));
    });
  }

  @override
  $SyncStateCopyWith<$Res>? get syncState {
    if (_value.syncState == null) {
      return null;
    }

    return $SyncStateCopyWith<$Res>(_value.syncState!, (value) {
      return _then(_value.copyWith(syncState: value));
    });
  }

  @override
  $EventReportCopyWith<$Res>? get selectedFlaggedMessage {
    if (_value.selectedFlaggedMessage == null) {
      return null;
    }

    return $EventReportCopyWith<$Res>(_value.selectedFlaggedMessage!, (value) {
      return _then(_value.copyWith(selectedFlaggedMessage: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userProfile')
          User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          List<User>? searchMemberResults,
      @JsonKey(name: 'bannedUserIDs')
          List<String?>? bannedUserIDs,
      @JsonKey(name: 'flagged_message_events')
          List<EventReport?>? flaggedMessageEvents,
      @JsonKey(name: 'lastSyncTime')
          String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          SyncState? syncState,
      @JsonKey(name: 'selectedRoom')
          String? selectedRoom,
      @JsonKey(name: 'selected_flagged_message')
          EventReport? selectedFlaggedMessage});

  @override
  $UserCopyWith<$Res>? get userProfile;
  @override
  $SyncResponseCopyWith<$Res>? get syncResponse;
  @override
  $SyncStateCopyWith<$Res>? get syncState;
  @override
  $EventReportCopyWith<$Res>? get selectedFlaggedMessage;
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, (v) => _then(v as _$_ChatState));

  @override
  _$_ChatState get _value => super._value as _$_ChatState;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? groupInfoMembers = freezed,
    Object? searchMemberResults = freezed,
    Object? bannedUserIDs = freezed,
    Object? flaggedMessageEvents = freezed,
    Object? lastSyncTime = freezed,
    Object? syncResponse = freezed,
    Object? syncState = freezed,
    Object? selectedRoom = freezed,
    Object? selectedFlaggedMessage = freezed,
  }) {
    return _then(_$_ChatState(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
      groupInfoMembers: groupInfoMembers == freezed
          ? _value.groupInfoMembers
          : groupInfoMembers // ignore: cast_nullable_to_non_nullable
              as List<RoomUser>?,
      searchMemberResults: searchMemberResults == freezed
          ? _value.searchMemberResults
          : searchMemberResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      bannedUserIDs: bannedUserIDs == freezed
          ? _value.bannedUserIDs
          : bannedUserIDs // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      flaggedMessageEvents: flaggedMessageEvents == freezed
          ? _value.flaggedMessageEvents
          : flaggedMessageEvents // ignore: cast_nullable_to_non_nullable
              as List<EventReport?>?,
      lastSyncTime: lastSyncTime == freezed
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      syncResponse: syncResponse == freezed
          ? _value.syncResponse
          : syncResponse // ignore: cast_nullable_to_non_nullable
              as SyncResponse?,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as SyncState?,
      selectedRoom: selectedRoom == freezed
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedFlaggedMessage: selectedFlaggedMessage == freezed
          ? _value.selectedFlaggedMessage
          : selectedFlaggedMessage // ignore: cast_nullable_to_non_nullable
              as EventReport?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatState implements _ChatState {
  _$_ChatState(
      {@JsonKey(name: 'userProfile') this.userProfile,
      @JsonKey(name: 'groupInfoMembers') this.groupInfoMembers,
      @JsonKey(name: 'searchMemberResults') this.searchMemberResults,
      @JsonKey(name: 'bannedUserIDs') this.bannedUserIDs,
      @JsonKey(name: 'flagged_message_events') this.flaggedMessageEvents,
      @JsonKey(name: 'lastSyncTime') this.lastSyncTime,
      @JsonKey(name: 'syncResponse') this.syncResponse,
      @JsonKey(name: 'syncState') this.syncState,
      @JsonKey(name: 'selectedRoom') this.selectedRoom,
      @JsonKey(name: 'selected_flagged_message') this.selectedFlaggedMessage});

  factory _$_ChatState.fromJson(Map<String, dynamic> json) =>
      _$$_ChatStateFromJson(json);

  @override
  @JsonKey(name: 'userProfile')
  final User? userProfile;

  /// Stores a group's members
  @override
  @JsonKey(name: 'groupInfoMembers')
  final List<RoomUser>? groupInfoMembers;

  /// Stores results for searching members
  @override
  @JsonKey(name: 'searchMemberResults')
  final List<User>? searchMemberResults;
// A list of banned users
  @override
  @JsonKey(name: 'bannedUserIDs')
  final List<String?>? bannedUserIDs;

  /// A list for flagged message events
  @override
  @JsonKey(name: 'flagged_message_events')
  final List<EventReport?>? flaggedMessageEvents;
// Final string lastSyncTime for chats
  @override
  @JsonKey(name: 'lastSyncTime')
  final String? lastSyncTime;
// Specific for rooms
  @override
  @JsonKey(name: 'syncResponse')
  final SyncResponse? syncResponse;
// Specific for the sync observer settings
  @override
  @JsonKey(name: 'syncState')
  final SyncState? syncState;
// The currently selected room
  @override
  @JsonKey(name: 'selectedRoom')
  final String? selectedRoom;

  /// The flagged message being viewed
  @override
  @JsonKey(name: 'selected_flagged_message')
  final EventReport? selectedFlaggedMessage;

  @override
  String toString() {
    return 'ChatState(userProfile: $userProfile, groupInfoMembers: $groupInfoMembers, searchMemberResults: $searchMemberResults, bannedUserIDs: $bannedUserIDs, flaggedMessageEvents: $flaggedMessageEvents, lastSyncTime: $lastSyncTime, syncResponse: $syncResponse, syncState: $syncState, selectedRoom: $selectedRoom, selectedFlaggedMessage: $selectedFlaggedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile) &&
            const DeepCollectionEquality()
                .equals(other.groupInfoMembers, groupInfoMembers) &&
            const DeepCollectionEquality()
                .equals(other.searchMemberResults, searchMemberResults) &&
            const DeepCollectionEquality()
                .equals(other.bannedUserIDs, bannedUserIDs) &&
            const DeepCollectionEquality()
                .equals(other.flaggedMessageEvents, flaggedMessageEvents) &&
            const DeepCollectionEquality()
                .equals(other.lastSyncTime, lastSyncTime) &&
            const DeepCollectionEquality()
                .equals(other.syncResponse, syncResponse) &&
            const DeepCollectionEquality().equals(other.syncState, syncState) &&
            const DeepCollectionEquality()
                .equals(other.selectedRoom, selectedRoom) &&
            const DeepCollectionEquality()
                .equals(other.selectedFlaggedMessage, selectedFlaggedMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userProfile),
      const DeepCollectionEquality().hash(groupInfoMembers),
      const DeepCollectionEquality().hash(searchMemberResults),
      const DeepCollectionEquality().hash(bannedUserIDs),
      const DeepCollectionEquality().hash(flaggedMessageEvents),
      const DeepCollectionEquality().hash(lastSyncTime),
      const DeepCollectionEquality().hash(syncResponse),
      const DeepCollectionEquality().hash(syncState),
      const DeepCollectionEquality().hash(selectedRoom),
      const DeepCollectionEquality().hash(selectedFlaggedMessage));

  @JsonKey(ignore: true)
  @override
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatStateToJson(
      this,
    );
  }
}

abstract class _ChatState implements ChatState {
  factory _ChatState(
      {@JsonKey(name: 'userProfile')
          final User? userProfile,
      @JsonKey(name: 'groupInfoMembers')
          final List<RoomUser>? groupInfoMembers,
      @JsonKey(name: 'searchMemberResults')
          final List<User>? searchMemberResults,
      @JsonKey(name: 'bannedUserIDs')
          final List<String?>? bannedUserIDs,
      @JsonKey(name: 'flagged_message_events')
          final List<EventReport?>? flaggedMessageEvents,
      @JsonKey(name: 'lastSyncTime')
          final String? lastSyncTime,
      @JsonKey(name: 'syncResponse')
          final SyncResponse? syncResponse,
      @JsonKey(name: 'syncState')
          final SyncState? syncState,
      @JsonKey(name: 'selectedRoom')
          final String? selectedRoom,
      @JsonKey(name: 'selected_flagged_message')
          final EventReport? selectedFlaggedMessage}) = _$_ChatState;

  factory _ChatState.fromJson(Map<String, dynamic> json) =
      _$_ChatState.fromJson;

  @override
  @JsonKey(name: 'userProfile')
  User? get userProfile;
  @override

  /// Stores a group's members
  @JsonKey(name: 'groupInfoMembers')
  List<RoomUser>? get groupInfoMembers;
  @override

  /// Stores results for searching members
  @JsonKey(name: 'searchMemberResults')
  List<User>? get searchMemberResults;
  @override // A list of banned users
  @JsonKey(name: 'bannedUserIDs')
  List<String?>? get bannedUserIDs;
  @override

  /// A list for flagged message events
  @JsonKey(name: 'flagged_message_events')
  List<EventReport?>? get flaggedMessageEvents;
  @override // Final string lastSyncTime for chats
  @JsonKey(name: 'lastSyncTime')
  String? get lastSyncTime;
  @override // Specific for rooms
  @JsonKey(name: 'syncResponse')
  SyncResponse? get syncResponse;
  @override // Specific for the sync observer settings
  @JsonKey(name: 'syncState')
  SyncState? get syncState;
  @override // The currently selected room
  @JsonKey(name: 'selectedRoom')
  String? get selectedRoom;
  @override

  /// The flagged message being viewed
  @JsonKey(name: 'selected_flagged_message')
  EventReport? get selectedFlaggedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
