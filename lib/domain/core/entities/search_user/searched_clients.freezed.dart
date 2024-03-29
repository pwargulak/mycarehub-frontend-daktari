// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searched_clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchedClients _$SearchedClientsFromJson(Map<String, dynamic> json) {
  return _SearchedClients.fromJson(json);
}

/// @nodoc
mixin _$SearchedClients {
  @JsonKey(name: 'searchClientUser')
  List<SearchUserResponse>? get clients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchedClientsCopyWith<SearchedClients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedClientsCopyWith<$Res> {
  factory $SearchedClientsCopyWith(
          SearchedClients value, $Res Function(SearchedClients) then) =
      _$SearchedClientsCopyWithImpl<$Res, SearchedClients>;
  @useResult
  $Res call(
      {@JsonKey(name: 'searchClientUser') List<SearchUserResponse>? clients});
}

/// @nodoc
class _$SearchedClientsCopyWithImpl<$Res, $Val extends SearchedClients>
    implements $SearchedClientsCopyWith<$Res> {
  _$SearchedClientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = freezed,
  }) {
    return _then(_value.copyWith(
      clients: freezed == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchedClientsCopyWith<$Res>
    implements $SearchedClientsCopyWith<$Res> {
  factory _$$_SearchedClientsCopyWith(
          _$_SearchedClients value, $Res Function(_$_SearchedClients) then) =
      __$$_SearchedClientsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'searchClientUser') List<SearchUserResponse>? clients});
}

/// @nodoc
class __$$_SearchedClientsCopyWithImpl<$Res>
    extends _$SearchedClientsCopyWithImpl<$Res, _$_SearchedClients>
    implements _$$_SearchedClientsCopyWith<$Res> {
  __$$_SearchedClientsCopyWithImpl(
      _$_SearchedClients _value, $Res Function(_$_SearchedClients) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = freezed,
  }) {
    return _then(_$_SearchedClients(
      clients: freezed == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchedClients implements _SearchedClients {
  _$_SearchedClients(
      {@JsonKey(name: 'searchClientUser')
          final List<SearchUserResponse>? clients})
      : _clients = clients;

  factory _$_SearchedClients.fromJson(Map<String, dynamic> json) =>
      _$$_SearchedClientsFromJson(json);

  final List<SearchUserResponse>? _clients;
  @override
  @JsonKey(name: 'searchClientUser')
  List<SearchUserResponse>? get clients {
    final value = _clients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchedClients(clients: $clients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchedClients &&
            const DeepCollectionEquality().equals(other._clients, _clients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_clients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchedClientsCopyWith<_$_SearchedClients> get copyWith =>
      __$$_SearchedClientsCopyWithImpl<_$_SearchedClients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchedClientsToJson(
      this,
    );
  }
}

abstract class _SearchedClients implements SearchedClients {
  factory _SearchedClients(
      {@JsonKey(name: 'searchClientUser')
          final List<SearchUserResponse>? clients}) = _$_SearchedClients;

  factory _SearchedClients.fromJson(Map<String, dynamic> json) =
      _$_SearchedClients.fromJson;

  @override
  @JsonKey(name: 'searchClientUser')
  List<SearchUserResponse>? get clients;
  @override
  @JsonKey(ignore: true)
  _$$_SearchedClientsCopyWith<_$_SearchedClients> get copyWith =>
      throw _privateConstructorUsedError;
}
