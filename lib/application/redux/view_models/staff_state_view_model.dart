import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';

class UserProfileViewModel extends Vm {
  final UserProfile? userProfileState;
  final Wait? wait;

  UserProfileViewModel({required this.userProfileState, required this.wait})
      : super(equals: <Object?>[userProfileState, wait]);

  factory UserProfileViewModel.fromStore(Store<AppState> store) {
    return UserProfileViewModel(
      userProfileState: store.state.userProfileState,
      wait: store.state.wait,
    );
  }
}
