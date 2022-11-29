// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestState _$ServiceRequestStateFromJson(Map<String, dynamic> json) {
  return _ServiceRequestState.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestState {
// Client service requests
  List<ServiceRequest>? get clientServiceRequests =>
      throw _privateConstructorUsedError; // Staff service requests
  List<ServiceRequest>? get staffServiceRequests =>
      throw _privateConstructorUsedError; // Resolved service requests
  List<ServiceRequest>? get resolvedServiceRequests =>
      throw _privateConstructorUsedError; // Service requests count
  PendingServiceRequestCount? get pendingServiceRequestsCount =>
      throw _privateConstructorUsedError; // Screening tools
  ScreeningToolsState? get screeningToolsState =>
      throw _privateConstructorUsedError;
  SurveyServiceRequestState? get surveyServiceRequestState =>
      throw _privateConstructorUsedError;

  /// Other booleans
  bool? get errorFetchingPendingServiceRequests =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestStateCopyWith<ServiceRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestStateCopyWith<$Res> {
  factory $ServiceRequestStateCopyWith(
          ServiceRequestState value, $Res Function(ServiceRequestState) then) =
      _$ServiceRequestStateCopyWithImpl<$Res, ServiceRequestState>;
  @useResult
  $Res call(
      {List<ServiceRequest>? clientServiceRequests,
      List<ServiceRequest>? staffServiceRequests,
      List<ServiceRequest>? resolvedServiceRequests,
      PendingServiceRequestCount? pendingServiceRequestsCount,
      ScreeningToolsState? screeningToolsState,
      SurveyServiceRequestState? surveyServiceRequestState,
      bool? errorFetchingPendingServiceRequests});

  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequestsCount;
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  $SurveyServiceRequestStateCopyWith<$Res>? get surveyServiceRequestState;
}

/// @nodoc
class _$ServiceRequestStateCopyWithImpl<$Res, $Val extends ServiceRequestState>
    implements $ServiceRequestStateCopyWith<$Res> {
  _$ServiceRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientServiceRequests = freezed,
    Object? staffServiceRequests = freezed,
    Object? resolvedServiceRequests = freezed,
    Object? pendingServiceRequestsCount = freezed,
    Object? screeningToolsState = freezed,
    Object? surveyServiceRequestState = freezed,
    Object? errorFetchingPendingServiceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      clientServiceRequests: freezed == clientServiceRequests
          ? _value.clientServiceRequests
          : clientServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      staffServiceRequests: freezed == staffServiceRequests
          ? _value.staffServiceRequests
          : staffServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      resolvedServiceRequests: freezed == resolvedServiceRequests
          ? _value.resolvedServiceRequests
          : resolvedServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequestsCount: freezed == pendingServiceRequestsCount
          ? _value.pendingServiceRequestsCount
          : pendingServiceRequestsCount // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      screeningToolsState: freezed == screeningToolsState
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      surveyServiceRequestState: freezed == surveyServiceRequestState
          ? _value.surveyServiceRequestState
          : surveyServiceRequestState // ignore: cast_nullable_to_non_nullable
              as SurveyServiceRequestState?,
      errorFetchingPendingServiceRequests: freezed ==
              errorFetchingPendingServiceRequests
          ? _value.errorFetchingPendingServiceRequests
          : errorFetchingPendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequestsCount {
    if (_value.pendingServiceRequestsCount == null) {
      return null;
    }

    return $PendingServiceRequestCountCopyWith<$Res>(
        _value.pendingServiceRequestsCount!, (value) {
      return _then(_value.copyWith(pendingServiceRequestsCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState {
    if (_value.screeningToolsState == null) {
      return null;
    }

    return $ScreeningToolsStateCopyWith<$Res>(_value.screeningToolsState!,
        (value) {
      return _then(_value.copyWith(screeningToolsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyServiceRequestStateCopyWith<$Res>? get surveyServiceRequestState {
    if (_value.surveyServiceRequestState == null) {
      return null;
    }

    return $SurveyServiceRequestStateCopyWith<$Res>(
        _value.surveyServiceRequestState!, (value) {
      return _then(_value.copyWith(surveyServiceRequestState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestStateCopyWith<$Res>
    implements $ServiceRequestStateCopyWith<$Res> {
  factory _$$_ServiceRequestStateCopyWith(_$_ServiceRequestState value,
          $Res Function(_$_ServiceRequestState) then) =
      __$$_ServiceRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceRequest>? clientServiceRequests,
      List<ServiceRequest>? staffServiceRequests,
      List<ServiceRequest>? resolvedServiceRequests,
      PendingServiceRequestCount? pendingServiceRequestsCount,
      ScreeningToolsState? screeningToolsState,
      SurveyServiceRequestState? surveyServiceRequestState,
      bool? errorFetchingPendingServiceRequests});

  @override
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequestsCount;
  @override
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  @override
  $SurveyServiceRequestStateCopyWith<$Res>? get surveyServiceRequestState;
}

/// @nodoc
class __$$_ServiceRequestStateCopyWithImpl<$Res>
    extends _$ServiceRequestStateCopyWithImpl<$Res, _$_ServiceRequestState>
    implements _$$_ServiceRequestStateCopyWith<$Res> {
  __$$_ServiceRequestStateCopyWithImpl(_$_ServiceRequestState _value,
      $Res Function(_$_ServiceRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientServiceRequests = freezed,
    Object? staffServiceRequests = freezed,
    Object? resolvedServiceRequests = freezed,
    Object? pendingServiceRequestsCount = freezed,
    Object? screeningToolsState = freezed,
    Object? surveyServiceRequestState = freezed,
    Object? errorFetchingPendingServiceRequests = freezed,
  }) {
    return _then(_$_ServiceRequestState(
      clientServiceRequests: freezed == clientServiceRequests
          ? _value.clientServiceRequests
          : clientServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      staffServiceRequests: freezed == staffServiceRequests
          ? _value.staffServiceRequests
          : staffServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      resolvedServiceRequests: freezed == resolvedServiceRequests
          ? _value.resolvedServiceRequests
          : resolvedServiceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequestsCount: freezed == pendingServiceRequestsCount
          ? _value.pendingServiceRequestsCount
          : pendingServiceRequestsCount // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      screeningToolsState: freezed == screeningToolsState
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      surveyServiceRequestState: freezed == surveyServiceRequestState
          ? _value.surveyServiceRequestState
          : surveyServiceRequestState // ignore: cast_nullable_to_non_nullable
              as SurveyServiceRequestState?,
      errorFetchingPendingServiceRequests: freezed ==
              errorFetchingPendingServiceRequests
          ? _value.errorFetchingPendingServiceRequests
          : errorFetchingPendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestState implements _ServiceRequestState {
  _$_ServiceRequestState(
      {this.clientServiceRequests,
      this.staffServiceRequests,
      this.resolvedServiceRequests,
      this.pendingServiceRequestsCount,
      this.screeningToolsState,
      this.surveyServiceRequestState,
      this.errorFetchingPendingServiceRequests});

  factory _$_ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestStateFromJson(json);

// Client service requests
  @override
  final List<ServiceRequest>? clientServiceRequests;
// Staff service requests
  @override
  final List<ServiceRequest>? staffServiceRequests;
// Resolved service requests
  @override
  final List<ServiceRequest>? resolvedServiceRequests;
// Service requests count
  @override
  final PendingServiceRequestCount? pendingServiceRequestsCount;
// Screening tools
  @override
  final ScreeningToolsState? screeningToolsState;
  @override
  final SurveyServiceRequestState? surveyServiceRequestState;

  /// Other booleans
  @override
  final bool? errorFetchingPendingServiceRequests;

  @override
  String toString() {
    return 'ServiceRequestState(clientServiceRequests: $clientServiceRequests, staffServiceRequests: $staffServiceRequests, resolvedServiceRequests: $resolvedServiceRequests, pendingServiceRequestsCount: $pendingServiceRequestsCount, screeningToolsState: $screeningToolsState, surveyServiceRequestState: $surveyServiceRequestState, errorFetchingPendingServiceRequests: $errorFetchingPendingServiceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestState &&
            const DeepCollectionEquality()
                .equals(other.clientServiceRequests, clientServiceRequests) &&
            const DeepCollectionEquality()
                .equals(other.staffServiceRequests, staffServiceRequests) &&
            const DeepCollectionEquality().equals(
                other.resolvedServiceRequests, resolvedServiceRequests) &&
            (identical(other.pendingServiceRequestsCount,
                    pendingServiceRequestsCount) ||
                other.pendingServiceRequestsCount ==
                    pendingServiceRequestsCount) &&
            (identical(other.screeningToolsState, screeningToolsState) ||
                other.screeningToolsState == screeningToolsState) &&
            (identical(other.surveyServiceRequestState,
                    surveyServiceRequestState) ||
                other.surveyServiceRequestState == surveyServiceRequestState) &&
            (identical(other.errorFetchingPendingServiceRequests,
                    errorFetchingPendingServiceRequests) ||
                other.errorFetchingPendingServiceRequests ==
                    errorFetchingPendingServiceRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clientServiceRequests),
      const DeepCollectionEquality().hash(staffServiceRequests),
      const DeepCollectionEquality().hash(resolvedServiceRequests),
      pendingServiceRequestsCount,
      screeningToolsState,
      surveyServiceRequestState,
      errorFetchingPendingServiceRequests);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestStateCopyWith<_$_ServiceRequestState> get copyWith =>
      __$$_ServiceRequestStateCopyWithImpl<_$_ServiceRequestState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestStateToJson(
      this,
    );
  }
}

abstract class _ServiceRequestState implements ServiceRequestState {
  factory _ServiceRequestState(
          {final List<ServiceRequest>? clientServiceRequests,
          final List<ServiceRequest>? staffServiceRequests,
          final List<ServiceRequest>? resolvedServiceRequests,
          final PendingServiceRequestCount? pendingServiceRequestsCount,
          final ScreeningToolsState? screeningToolsState,
          final SurveyServiceRequestState? surveyServiceRequestState,
          final bool? errorFetchingPendingServiceRequests}) =
      _$_ServiceRequestState;

  factory _ServiceRequestState.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestState.fromJson;

  @override // Client service requests
  List<ServiceRequest>? get clientServiceRequests;
  @override // Staff service requests
  List<ServiceRequest>? get staffServiceRequests;
  @override // Resolved service requests
  List<ServiceRequest>? get resolvedServiceRequests;
  @override // Service requests count
  PendingServiceRequestCount? get pendingServiceRequestsCount;
  @override // Screening tools
  ScreeningToolsState? get screeningToolsState;
  @override
  SurveyServiceRequestState? get surveyServiceRequestState;
  @override

  /// Other booleans
  bool? get errorFetchingPendingServiceRequests;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestStateCopyWith<_$_ServiceRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
