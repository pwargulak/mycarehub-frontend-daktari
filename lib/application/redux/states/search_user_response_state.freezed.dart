// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponseState _$SearchUserResponseStateFromJson(
    Map<String, dynamic> json) {
  return _SearchUserResponseState.fromJson(json);
}

/// @nodoc
mixin _$SearchUserResponseState {
  List<SearchUserResponse?>? get searchUserResponses =>
      throw _privateConstructorUsedError;
  List<SearchUserResponse?>? get selectedUsers =>
      throw _privateConstructorUsedError;
  SearchUserResponse? get selectedSearchUserResponse =>
      throw _privateConstructorUsedError; // when the user selects a specific user from the list
  bool? get errorSearchingUser => throw _privateConstructorUsedError;
  bool? get timeoutSearchingUser => throw _privateConstructorUsedError;
  bool? get noUserFound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseStateCopyWith<SearchUserResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseStateCopyWith<$Res> {
  factory $SearchUserResponseStateCopyWith(SearchUserResponseState value,
          $Res Function(SearchUserResponseState) then) =
      _$SearchUserResponseStateCopyWithImpl<$Res, SearchUserResponseState>;
  @useResult
  $Res call(
      {List<SearchUserResponse?>? searchUserResponses,
      List<SearchUserResponse?>? selectedUsers,
      SearchUserResponse? selectedSearchUserResponse,
      bool? errorSearchingUser,
      bool? timeoutSearchingUser,
      bool? noUserFound});

  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse;
}

/// @nodoc
class _$SearchUserResponseStateCopyWithImpl<$Res,
        $Val extends SearchUserResponseState>
    implements $SearchUserResponseStateCopyWith<$Res> {
  _$SearchUserResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchUserResponses = freezed,
    Object? selectedUsers = freezed,
    Object? selectedSearchUserResponse = freezed,
    Object? errorSearchingUser = freezed,
    Object? timeoutSearchingUser = freezed,
    Object? noUserFound = freezed,
  }) {
    return _then(_value.copyWith(
      searchUserResponses: freezed == searchUserResponses
          ? _value.searchUserResponses
          : searchUserResponses // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedUsers: freezed == selectedUsers
          ? _value.selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedSearchUserResponse: freezed == selectedSearchUserResponse
          ? _value.selectedSearchUserResponse
          : selectedSearchUserResponse // ignore: cast_nullable_to_non_nullable
              as SearchUserResponse?,
      errorSearchingUser: freezed == errorSearchingUser
          ? _value.errorSearchingUser
          : errorSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutSearchingUser: freezed == timeoutSearchingUser
          ? _value.timeoutSearchingUser
          : timeoutSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      noUserFound: freezed == noUserFound
          ? _value.noUserFound
          : noUserFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse {
    if (_value.selectedSearchUserResponse == null) {
      return null;
    }

    return $SearchUserResponseCopyWith<$Res>(_value.selectedSearchUserResponse!,
        (value) {
      return _then(_value.copyWith(selectedSearchUserResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchUserResponseStateCopyWith<$Res>
    implements $SearchUserResponseStateCopyWith<$Res> {
  factory _$$_SearchUserResponseStateCopyWith(_$_SearchUserResponseState value,
          $Res Function(_$_SearchUserResponseState) then) =
      __$$_SearchUserResponseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchUserResponse?>? searchUserResponses,
      List<SearchUserResponse?>? selectedUsers,
      SearchUserResponse? selectedSearchUserResponse,
      bool? errorSearchingUser,
      bool? timeoutSearchingUser,
      bool? noUserFound});

  @override
  $SearchUserResponseCopyWith<$Res>? get selectedSearchUserResponse;
}

/// @nodoc
class __$$_SearchUserResponseStateCopyWithImpl<$Res>
    extends _$SearchUserResponseStateCopyWithImpl<$Res,
        _$_SearchUserResponseState>
    implements _$$_SearchUserResponseStateCopyWith<$Res> {
  __$$_SearchUserResponseStateCopyWithImpl(_$_SearchUserResponseState _value,
      $Res Function(_$_SearchUserResponseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchUserResponses = freezed,
    Object? selectedUsers = freezed,
    Object? selectedSearchUserResponse = freezed,
    Object? errorSearchingUser = freezed,
    Object? timeoutSearchingUser = freezed,
    Object? noUserFound = freezed,
  }) {
    return _then(_$_SearchUserResponseState(
      searchUserResponses: freezed == searchUserResponses
          ? _value._searchUserResponses
          : searchUserResponses // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedUsers: freezed == selectedUsers
          ? _value._selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse?>?,
      selectedSearchUserResponse: freezed == selectedSearchUserResponse
          ? _value.selectedSearchUserResponse
          : selectedSearchUserResponse // ignore: cast_nullable_to_non_nullable
              as SearchUserResponse?,
      errorSearchingUser: freezed == errorSearchingUser
          ? _value.errorSearchingUser
          : errorSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutSearchingUser: freezed == timeoutSearchingUser
          ? _value.timeoutSearchingUser
          : timeoutSearchingUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      noUserFound: freezed == noUserFound
          ? _value.noUserFound
          : noUserFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponseState implements _SearchUserResponseState {
  _$_SearchUserResponseState(
      {final List<SearchUserResponse?>? searchUserResponses,
      final List<SearchUserResponse?>? selectedUsers,
      this.selectedSearchUserResponse,
      this.errorSearchingUser,
      this.timeoutSearchingUser,
      this.noUserFound})
      : _searchUserResponses = searchUserResponses,
        _selectedUsers = selectedUsers;

  factory _$_SearchUserResponseState.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseStateFromJson(json);

  final List<SearchUserResponse?>? _searchUserResponses;
  @override
  List<SearchUserResponse?>? get searchUserResponses {
    final value = _searchUserResponses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SearchUserResponse?>? _selectedUsers;
  @override
  List<SearchUserResponse?>? get selectedUsers {
    final value = _selectedUsers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SearchUserResponse? selectedSearchUserResponse;
// when the user selects a specific user from the list
  @override
  final bool? errorSearchingUser;
  @override
  final bool? timeoutSearchingUser;
  @override
  final bool? noUserFound;

  @override
  String toString() {
    return 'SearchUserResponseState(searchUserResponses: $searchUserResponses, selectedUsers: $selectedUsers, selectedSearchUserResponse: $selectedSearchUserResponse, errorSearchingUser: $errorSearchingUser, timeoutSearchingUser: $timeoutSearchingUser, noUserFound: $noUserFound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchUserResponseState &&
            const DeepCollectionEquality()
                .equals(other._searchUserResponses, _searchUserResponses) &&
            const DeepCollectionEquality()
                .equals(other._selectedUsers, _selectedUsers) &&
            (identical(other.selectedSearchUserResponse,
                    selectedSearchUserResponse) ||
                other.selectedSearchUserResponse ==
                    selectedSearchUserResponse) &&
            (identical(other.errorSearchingUser, errorSearchingUser) ||
                other.errorSearchingUser == errorSearchingUser) &&
            (identical(other.timeoutSearchingUser, timeoutSearchingUser) ||
                other.timeoutSearchingUser == timeoutSearchingUser) &&
            (identical(other.noUserFound, noUserFound) ||
                other.noUserFound == noUserFound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchUserResponses),
      const DeepCollectionEquality().hash(_selectedUsers),
      selectedSearchUserResponse,
      errorSearchingUser,
      timeoutSearchingUser,
      noUserFound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchUserResponseStateCopyWith<_$_SearchUserResponseState>
      get copyWith =>
          __$$_SearchUserResponseStateCopyWithImpl<_$_SearchUserResponseState>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchUserResponseStateToJson(
      this,
    );
  }
}

abstract class _SearchUserResponseState implements SearchUserResponseState {
  factory _SearchUserResponseState(
      {final List<SearchUserResponse?>? searchUserResponses,
      final List<SearchUserResponse?>? selectedUsers,
      final SearchUserResponse? selectedSearchUserResponse,
      final bool? errorSearchingUser,
      final bool? timeoutSearchingUser,
      final bool? noUserFound}) = _$_SearchUserResponseState;

  factory _SearchUserResponseState.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponseState.fromJson;

  @override
  List<SearchUserResponse?>? get searchUserResponses;
  @override
  List<SearchUserResponse?>? get selectedUsers;
  @override
  SearchUserResponse? get selectedSearchUserResponse;
  @override // when the user selects a specific user from the list
  bool? get errorSearchingUser;
  @override
  bool? get timeoutSearchingUser;
  @override
  bool? get noUserFound;
  @override
  @JsonKey(ignore: true)
  _$$_SearchUserResponseStateCopyWith<_$_SearchUserResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
