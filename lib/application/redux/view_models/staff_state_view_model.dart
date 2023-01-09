import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';

class UserProfileViewModel extends Vm {
  final UserProfile? userProfile;
  final Wait? wait;

  UserProfileViewModel({required this.userProfile, required this.wait})
      : super(equals: <Object?>[userProfile, wait]);

  factory UserProfileViewModel.fromStore(Store<AppState> store) {
    return UserProfileViewModel(
      userProfile: store.state.userProfileState?.userProfile,
      wait: store.state.wait,
    );
  }
}
