// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/app_state_view_model.dart';
import 'package:myharehubpro/domain/core/entities/core/staff_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/core/widgets/logout_button.dart';
import 'package:myharehubpro/presentation/profile/widgets/user_details_card_widget.dart'
    as local;
import 'package:myharehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:

class UserProfilePage extends StatelessWidget {
  /// [UserProfilePage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      appBar: const CustomAppBar(
        title: myProfileString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              final StaffState? staffState = vm.state.staffState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  local.UserDetailsCard(
                    clinicName: UNKNOWN,
                    gender: staffState?.user?.gender ?? Gender.unknown,
                    name: staffState?.user?.name ?? UNKNOWN,
                    licenseNumber: staffState?.staffNumber ?? UNKNOWN,
                    phoneNumber:
                        staffState?.user?.primaryContact?.value ?? UNKNOWN,
                    profession: profession,
                  ),
                  mediumVerticalSizedBox,
                  UserProfileItem(
                    iconPath: helpCircleIcon,
                    title: helpContactAdminString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.contactAdminPage),
                  ),
                  UserProfileItem(
                    iconPath: feedbackIconSvgPath,
                    title: resolvedRequestsString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.resolvedServiceRequestsPage),
                  ),
                  UserProfileItem(
                    iconPath: faqsIconSvgPath,
                    title: faqsString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.profileFaqsPage),
                  ),
                  UserProfileItem(
                    iconPath: settingsIconSvgPath,
                    title: settingsString,
                    itemBackgroundColor: AppColors.profileListCardColor,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.settingsPage),
                  ),
                  mediumVerticalSizedBox,
                  const SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: LogoutButton(),
                  ),
                  mediumVerticalSizedBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          copyrightString,
                          style: normalSize10Text(Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          '$appVersionString $APPVERSION',
                          style: normalSize9Text(Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
