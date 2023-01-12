// Package imports:
import 'package:prohealth360_daktari/application/redux/states/user_profile/programs_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class UpdateUserProfileStateAction extends ReduxAction<AppState> {
  UpdateUserProfileStateAction({
    this.userProfile,
    this.programsState,
  });

  final UserProfile? userProfile;
  final ProgramsState? programsState;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        userProfile: userProfile ?? state.userProfileState?.userProfile,
        programsState: programsState ?? state.userProfileState?.programsState,
      ),
    );

    return newState;
  }
}
