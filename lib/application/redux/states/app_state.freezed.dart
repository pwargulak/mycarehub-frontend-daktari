// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  HomeState? get homeState => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  UserProfileState? get userProfileState => throw _privateConstructorUsedError;
  SurveyState? get surveyState => throw _privateConstructorUsedError;
  ServiceRequestState? get serviceRequestState =>
      throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  ChatState? get chatState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AuthCredentials? credentials,
      HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      UserProfileState? userProfileState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      ConnectivityState? connectivityState,
      ChatState? chatState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $HomeStateCopyWith<$Res>? get homeState;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $UserProfileStateCopyWith<$Res>? get userProfileState;
  $SurveyStateCopyWith<$Res>? get surveyState;
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? userProfileState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? connectivityState = freezed,
    Object? chatState = null,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      homeState: freezed == homeState
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
      onboardingState: freezed == onboardingState
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: freezed == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: freezed == miscState
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      userProfileState: freezed == userProfileState
          ? _value.userProfileState
          : userProfileState // ignore: cast_nullable_to_non_nullable
              as UserProfileState?,
      surveyState: freezed == surveyState
          ? _value.surveyState
          : surveyState // ignore: cast_nullable_to_non_nullable
              as SurveyState?,
      serviceRequestState: freezed == serviceRequestState
          ? _value.serviceRequestState
          : serviceRequestState // ignore: cast_nullable_to_non_nullable
              as ServiceRequestState?,
      connectivityState: freezed == connectivityState
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      chatState: null == chatState
          ? _value.chatState
          : chatState // ignore: cast_nullable_to_non_nullable
              as ChatState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthCredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<$Res>? get homeState {
    if (_value.homeState == null) {
      return null;
    }

    return $HomeStateCopyWith<$Res>(_value.homeState!, (value) {
      return _then(_value.copyWith(homeState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OnboardingStateCopyWith<$Res>? get onboardingState {
    if (_value.onboardingState == null) {
      return null;
    }

    return $OnboardingStateCopyWith<$Res>(_value.onboardingState!, (value) {
      return _then(_value.copyWith(onboardingState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState {
    if (_value.bottomNavigationState == null) {
      return null;
    }

    return $BottomNavigationStateCopyWith<$Res>(_value.bottomNavigationState!,
        (value) {
      return _then(_value.copyWith(bottomNavigationState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MiscStateCopyWith<$Res>? get miscState {
    if (_value.miscState == null) {
      return null;
    }

    return $MiscStateCopyWith<$Res>(_value.miscState!, (value) {
      return _then(_value.copyWith(miscState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileStateCopyWith<$Res>? get userProfileState {
    if (_value.userProfileState == null) {
      return null;
    }

    return $UserProfileStateCopyWith<$Res>(_value.userProfileState!, (value) {
      return _then(_value.copyWith(userProfileState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyStateCopyWith<$Res>? get surveyState {
    if (_value.surveyState == null) {
      return null;
    }

    return $SurveyStateCopyWith<$Res>(_value.surveyState!, (value) {
      return _then(_value.copyWith(surveyState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState {
    if (_value.serviceRequestState == null) {
      return null;
    }

    return $ServiceRequestStateCopyWith<$Res>(_value.serviceRequestState!,
        (value) {
      return _then(_value.copyWith(serviceRequestState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectivityStateCopyWith<$Res>? get connectivityState {
    if (_value.connectivityState == null) {
      return null;
    }

    return $ConnectivityStateCopyWith<$Res>(_value.connectivityState!, (value) {
      return _then(_value.copyWith(connectivityState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_StateCopyWith(_$_State value, $Res Function(_$_State) then) =
      __$$_StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthCredentials? credentials,
      HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      UserProfileState? userProfileState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      ConnectivityState? connectivityState,
      ChatState? chatState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $HomeStateCopyWith<$Res>? get homeState;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $UserProfileStateCopyWith<$Res>? get userProfileState;
  @override
  $SurveyStateCopyWith<$Res>? get surveyState;
  @override
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class __$$_StateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_State>
    implements _$$_StateCopyWith<$Res> {
  __$$_StateCopyWithImpl(_$_State _value, $Res Function(_$_State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? userProfileState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? connectivityState = freezed,
    Object? chatState = null,
    Object? wait = freezed,
  }) {
    return _then(_$_State(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      homeState: freezed == homeState
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
      onboardingState: freezed == onboardingState
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: freezed == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: freezed == miscState
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      userProfileState: freezed == userProfileState
          ? _value.userProfileState
          : userProfileState // ignore: cast_nullable_to_non_nullable
              as UserProfileState?,
      surveyState: freezed == surveyState
          ? _value.surveyState
          : surveyState // ignore: cast_nullable_to_non_nullable
              as SurveyState?,
      serviceRequestState: freezed == serviceRequestState
          ? _value.serviceRequestState
          : serviceRequestState // ignore: cast_nullable_to_non_nullable
              as ServiceRequestState?,
      connectivityState: freezed == connectivityState
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      chatState: null == chatState
          ? _value.chatState
          : chatState // ignore: cast_nullable_to_non_nullable
              as ChatState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_State implements _State {
  _$_State(
      {this.credentials,
      this.homeState,
      this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      this.userProfileState,
      this.surveyState,
      this.serviceRequestState,
      this.connectivityState,
      this.chatState,
      @JsonKey(ignore: true) this.wait});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$$_StateFromJson(json);

  @override
  final AuthCredentials? credentials;
  @override
  final HomeState? homeState;
  @override
  final OnboardingState? onboardingState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  final UserProfileState? userProfileState;
  @override
  final SurveyState? surveyState;
  @override
  final ServiceRequestState? serviceRequestState;
  @override
  final ConnectivityState? connectivityState;
  @override
  final ChatState? chatState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(credentials: $credentials, homeState: $homeState, onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, userProfileState: $userProfileState, surveyState: $surveyState, serviceRequestState: $serviceRequestState, connectivityState: $connectivityState, chatState: $chatState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_State &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.homeState, homeState) ||
                other.homeState == homeState) &&
            (identical(other.onboardingState, onboardingState) ||
                other.onboardingState == onboardingState) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                other.bottomNavigationState == bottomNavigationState) &&
            (identical(other.miscState, miscState) ||
                other.miscState == miscState) &&
            (identical(other.userProfileState, userProfileState) ||
                other.userProfileState == userProfileState) &&
            (identical(other.surveyState, surveyState) ||
                other.surveyState == surveyState) &&
            (identical(other.serviceRequestState, serviceRequestState) ||
                other.serviceRequestState == serviceRequestState) &&
            (identical(other.connectivityState, connectivityState) ||
                other.connectivityState == connectivityState) &&
            const DeepCollectionEquality().equals(other.chatState, chatState) &&
            (identical(other.wait, wait) || other.wait == wait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      credentials,
      homeState,
      onboardingState,
      bottomNavigationState,
      miscState,
      userProfileState,
      surveyState,
      serviceRequestState,
      connectivityState,
      const DeepCollectionEquality().hash(chatState),
      wait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateCopyWith<_$_State> get copyWith =>
      __$$_StateCopyWithImpl<_$_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateToJson(
      this,
    );
  }
}

abstract class _State implements AppState {
  factory _State(
      {final AuthCredentials? credentials,
      final HomeState? homeState,
      final OnboardingState? onboardingState,
      final BottomNavigationState? bottomNavigationState,
      final MiscState? miscState,
      final UserProfileState? userProfileState,
      final SurveyState? surveyState,
      final ServiceRequestState? serviceRequestState,
      final ConnectivityState? connectivityState,
      final ChatState? chatState,
      @JsonKey(ignore: true) final Wait? wait}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  AuthCredentials? get credentials;
  @override
  HomeState? get homeState;
  @override
  OnboardingState? get onboardingState;
  @override
  BottomNavigationState? get bottomNavigationState;
  @override
  MiscState? get miscState;
  @override
  UserProfileState? get userProfileState;
  @override
  SurveyState? get surveyState;
  @override
  ServiceRequestState? get serviceRequestState;
  @override
  ConnectivityState? get connectivityState;
  @override
  ChatState? get chatState;
  @override
  @JsonKey(ignore: true)
  Wait? get wait;
  @override
  @JsonKey(ignore: true)
  _$$_StateCopyWith<_$_State> get copyWith =>
      throw _privateConstructorUsedError;
}
