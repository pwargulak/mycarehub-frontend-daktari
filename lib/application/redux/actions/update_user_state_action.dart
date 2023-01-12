// Package imports:
import 'package:prohealth360_daktari/application/redux/states/user_profile_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({
    this.active,
    this.nickName,
    this.phoneNumber,
    this.name,
    this.avatar,
    this.termsAccepted,
    this.pinChangeRequired,
    this.isPhoneVerified,
  });

  final bool? active;
  final String? nickName;
  final String? name;
  final String? avatar;
  final Contact? phoneNumber;
  final bool? termsAccepted;
  final bool? pinChangeRequired;
  final bool? isPhoneVerified;

  @override
  AppState reduce() {
    final User? userFromState = state.userProfileState?.userProfile?.user;

    final User? newUserProfile =
        state.userProfileState?.userProfile?.user?.copyWith(
      active: this.active ?? userFromState?.active,
      name: name ?? userFromState?.name,
      avatar: avatar ?? userFromState?.avatar,
      username: nickName ?? userFromState?.username,
      termsAccepted: termsAccepted ?? userFromState?.termsAccepted,
      pinChangeRequired: pinChangeRequired ?? userFromState?.pinChangeRequired,
      isPhoneVerified: isPhoneVerified ?? userFromState?.isPhoneVerified,
    );

    final UserProfileState? newState = state.userProfileState?.copyWith(
      userProfile:
          state.userProfileState?.userProfile?.copyWith(user: newUserProfile),
    );

    return state.copyWith.call(userProfileState: newState);
  }
}
