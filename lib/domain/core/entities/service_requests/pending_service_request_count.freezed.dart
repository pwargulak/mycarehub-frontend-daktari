// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_service_request_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingServiceRequestCount _$PendingServiceRequestCountFromJson(
    Map<String, dynamic> json) {
  return _PendingServiceRequestCount.fromJson(json);
}

/// @nodoc
mixin _$PendingServiceRequestCount {
  @JsonKey(name: 'clientsServiceRequestCount')
  ServiceRequestTypeCount? get clientsServiceRequestCount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'staffServiceRequestCount')
  ServiceRequestTypeCount? get staffServiceRequestCount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingServiceRequestCountCopyWith<PendingServiceRequestCount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingServiceRequestCountCopyWith<$Res> {
  factory $PendingServiceRequestCountCopyWith(PendingServiceRequestCount value,
          $Res Function(PendingServiceRequestCount) then) =
      _$PendingServiceRequestCountCopyWithImpl<$Res,
          PendingServiceRequestCount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clientsServiceRequestCount')
          ServiceRequestTypeCount? clientsServiceRequestCount,
      @JsonKey(name: 'staffServiceRequestCount')
          ServiceRequestTypeCount? staffServiceRequestCount});

  $ServiceRequestTypeCountCopyWith<$Res>? get clientsServiceRequestCount;
  $ServiceRequestTypeCountCopyWith<$Res>? get staffServiceRequestCount;
}

/// @nodoc
class _$PendingServiceRequestCountCopyWithImpl<$Res,
        $Val extends PendingServiceRequestCount>
    implements $PendingServiceRequestCountCopyWith<$Res> {
  _$PendingServiceRequestCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientsServiceRequestCount = freezed,
    Object? staffServiceRequestCount = freezed,
  }) {
    return _then(_value.copyWith(
      clientsServiceRequestCount: freezed == clientsServiceRequestCount
          ? _value.clientsServiceRequestCount
          : clientsServiceRequestCount // ignore: cast_nullable_to_non_nullable
              as ServiceRequestTypeCount?,
      staffServiceRequestCount: freezed == staffServiceRequestCount
          ? _value.staffServiceRequestCount
          : staffServiceRequestCount // ignore: cast_nullable_to_non_nullable
              as ServiceRequestTypeCount?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestTypeCountCopyWith<$Res>? get clientsServiceRequestCount {
    if (_value.clientsServiceRequestCount == null) {
      return null;
    }

    return $ServiceRequestTypeCountCopyWith<$Res>(
        _value.clientsServiceRequestCount!, (value) {
      return _then(_value.copyWith(clientsServiceRequestCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestTypeCountCopyWith<$Res>? get staffServiceRequestCount {
    if (_value.staffServiceRequestCount == null) {
      return null;
    }

    return $ServiceRequestTypeCountCopyWith<$Res>(
        _value.staffServiceRequestCount!, (value) {
      return _then(_value.copyWith(staffServiceRequestCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PendingServiceRequestCountCopyWith<$Res>
    implements $PendingServiceRequestCountCopyWith<$Res> {
  factory _$$_PendingServiceRequestCountCopyWith(
          _$_PendingServiceRequestCount value,
          $Res Function(_$_PendingServiceRequestCount) then) =
      __$$_PendingServiceRequestCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clientsServiceRequestCount')
          ServiceRequestTypeCount? clientsServiceRequestCount,
      @JsonKey(name: 'staffServiceRequestCount')
          ServiceRequestTypeCount? staffServiceRequestCount});

  @override
  $ServiceRequestTypeCountCopyWith<$Res>? get clientsServiceRequestCount;
  @override
  $ServiceRequestTypeCountCopyWith<$Res>? get staffServiceRequestCount;
}

/// @nodoc
class __$$_PendingServiceRequestCountCopyWithImpl<$Res>
    extends _$PendingServiceRequestCountCopyWithImpl<$Res,
        _$_PendingServiceRequestCount>
    implements _$$_PendingServiceRequestCountCopyWith<$Res> {
  __$$_PendingServiceRequestCountCopyWithImpl(
      _$_PendingServiceRequestCount _value,
      $Res Function(_$_PendingServiceRequestCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientsServiceRequestCount = freezed,
    Object? staffServiceRequestCount = freezed,
  }) {
    return _then(_$_PendingServiceRequestCount(
      clientsServiceRequestCount: freezed == clientsServiceRequestCount
          ? _value.clientsServiceRequestCount
          : clientsServiceRequestCount // ignore: cast_nullable_to_non_nullable
              as ServiceRequestTypeCount?,
      staffServiceRequestCount: freezed == staffServiceRequestCount
          ? _value.staffServiceRequestCount
          : staffServiceRequestCount // ignore: cast_nullable_to_non_nullable
              as ServiceRequestTypeCount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingServiceRequestCount implements _PendingServiceRequestCount {
  _$_PendingServiceRequestCount(
      {@JsonKey(name: 'clientsServiceRequestCount')
          this.clientsServiceRequestCount,
      @JsonKey(name: 'staffServiceRequestCount')
          this.staffServiceRequestCount});

  factory _$_PendingServiceRequestCount.fromJson(Map<String, dynamic> json) =>
      _$$_PendingServiceRequestCountFromJson(json);

  @override
  @JsonKey(name: 'clientsServiceRequestCount')
  final ServiceRequestTypeCount? clientsServiceRequestCount;
  @override
  @JsonKey(name: 'staffServiceRequestCount')
  final ServiceRequestTypeCount? staffServiceRequestCount;

  @override
  String toString() {
    return 'PendingServiceRequestCount(clientsServiceRequestCount: $clientsServiceRequestCount, staffServiceRequestCount: $staffServiceRequestCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingServiceRequestCount &&
            (identical(other.clientsServiceRequestCount,
                    clientsServiceRequestCount) ||
                other.clientsServiceRequestCount ==
                    clientsServiceRequestCount) &&
            (identical(
                    other.staffServiceRequestCount, staffServiceRequestCount) ||
                other.staffServiceRequestCount == staffServiceRequestCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, clientsServiceRequestCount, staffServiceRequestCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PendingServiceRequestCountCopyWith<_$_PendingServiceRequestCount>
      get copyWith => __$$_PendingServiceRequestCountCopyWithImpl<
          _$_PendingServiceRequestCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingServiceRequestCountToJson(
      this,
    );
  }
}

abstract class _PendingServiceRequestCount
    implements PendingServiceRequestCount {
  factory _PendingServiceRequestCount(
          {@JsonKey(name: 'clientsServiceRequestCount')
              final ServiceRequestTypeCount? clientsServiceRequestCount,
          @JsonKey(name: 'staffServiceRequestCount')
              final ServiceRequestTypeCount? staffServiceRequestCount}) =
      _$_PendingServiceRequestCount;

  factory _PendingServiceRequestCount.fromJson(Map<String, dynamic> json) =
      _$_PendingServiceRequestCount.fromJson;

  @override
  @JsonKey(name: 'clientsServiceRequestCount')
  ServiceRequestTypeCount? get clientsServiceRequestCount;
  @override
  @JsonKey(name: 'staffServiceRequestCount')
  ServiceRequestTypeCount? get staffServiceRequestCount;
  @override
  @JsonKey(ignore: true)
  _$$_PendingServiceRequestCountCopyWith<_$_PendingServiceRequestCount>
      get copyWith => throw _privateConstructorUsedError;
}
