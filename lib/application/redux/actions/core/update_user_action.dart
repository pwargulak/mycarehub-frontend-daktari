// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';

/// This class replaces the whole user object
class UpdateUserAction extends ReduxAction<AppState> {
  UpdateUserAction({this.user});

  final User? user;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith(user: user),
    );
    return newState;
  }
}
