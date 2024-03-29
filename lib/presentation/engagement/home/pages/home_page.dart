// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/set_push_token/set_push_token_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/staff_state_view_model.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
// Package imports:

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch(
        context,
        SetPushToken(
          firebaseMessaging: FirebaseMessaging.instance,
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.galleryColor,
      body: SingleChildScrollView(
        child: StoreConnector<AppState, UserProfileViewModel>(
          converter: (Store<AppState> store) =>
              UserProfileViewModel.fromStore(store),
          builder: (BuildContext context, UserProfileViewModel vm) {
            final String firstName =
                vm.userProfile?.user?.firstName ?? UNKNOWN;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(1.0),
                        BlendMode.dstATop,
                      ),
                      image: const AssetImage(blendedBackgroundImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: ResponsiveWidget.isLargeScreen(context)
                      ? const EdgeInsets.fromLTRB(20, 0, 20, 40)
                      : const EdgeInsets.fromLTRB(5, 0, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mediumVerticalSizedBox,
                      veryLargeVerticalSizedBox,
                      const AppbarUser(),
                      veryLargeVerticalSizedBox,
                      veryLargeVerticalSizedBox,
                      Text(
                        removeTailingComma(
                          getGreetingMessage(
                            firstName == UNKNOWN ? '' : firstName,
                          ),
                        ),
                        style: boldSize24Text(Colors.white),
                      ),
                      smallVerticalSizedBox,
                    ],
                  ),
                ),
                // Add new user section
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Wrap(
                    children: <Widget>[
                      ActionCard(
                        title: addNewClientText,
                        iconUrl: addNewStaffImageSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.registerClientPage);
                        },
                      ),
                      ActionCard(
                        title: addNewStaffText,
                        iconUrl: addNewUserIconSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.addNewStaffPage);
                        },
                      ),
                      ActionCard(
                        title: addCaregiverText,
                        iconUrl: addNewUserIconSvg,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.registerCaregiverPage);
                        },
                      ),
                      ActionCard(
                        iconUrl: serviceRequestsIconSvg,
                        title: serviceRequestsText,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.serviceRequestsPage,
                        ),
                      ),
                      ActionCard(
                        key: searchActionCardKey,
                        title: searchString,
                        iconUrl: searchSvgPath,
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.searchPage);
                        },
                      ),
                      ActionCard(
                        key: surveysCardKey,
                        title: surveysString,
                        iconUrl: surveysSvgPath,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.surveysPage);
                        },
                      ),
                      ActionCard(
                        key: faqsCardKey,
                        title: faqsText,
                        iconUrl: faqsImageUrl,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.profileFaqsPage);
                        },
                      ),
                      ActionCard(
                        key: adminCardKey,
                        title: adminString,
                        iconUrl: adminSvgPath,
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.adminPage);
                        },
                      ),
                      ActionCard(
                        key: createGroupKey,
                        title: createGroupText,
                        iconUrl: newGroupImage,
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.createRoomPage);
                        },
                      ),
                      
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.home.index,
      ),
    );
  }
}
