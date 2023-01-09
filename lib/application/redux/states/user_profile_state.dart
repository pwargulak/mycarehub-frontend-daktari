import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/user_profile/programs_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';

part 'user_profile_state.freezed.dart';
part 'user_profile_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState({
    UserProfile? userProfile,
    ProgramsState? programsState,
  }) = _UserProfileState;

  factory UserProfileState.fromJson(Map<String, dynamic> json) =>
      _$UserProfileStateFromJson(json);

  factory UserProfileState.initial() => UserProfileState(
        userProfile: UserProfile.initial(),
        programsState: ProgramsState.initial(),
      );
}
