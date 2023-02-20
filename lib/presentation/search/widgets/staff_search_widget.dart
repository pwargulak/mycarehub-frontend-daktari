import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/assign_roles_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/roles_list.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/linked_facilities_widget.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/role_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/active_staff_actions.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/search_details_information_widget.dart';

class StaffSearchWidget extends StatefulWidget {
  const StaffSearchWidget({required this.rolesList});

  final RolesList rolesList;

  @override
  State<StaffSearchWidget> createState() => _StaffSearchWidgetState();
}

Map<RoleValue, bool> roleFields = <RoleValue, bool>{};

void createRoleFields(RolesList rolesList) {
  final List<RoleValue?>? roles =
      rolesList.roles?.map((Role role) => role.name).toList();

  for (final RoleValue role in RoleValue.values) {
    roleFields[role] = roles?.contains(role) ?? false;
  }
}

class _StaffSearchWidgetState extends State<StaffSearchWidget> {
  @override
  void initState() {
    super.initState();
    createRoleFields(widget.rolesList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoreConnector<AppState, SearchViewModel>(
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          final SearchUserResponse selectedSearchUserResponse =
              vm.selectedSearchUserResponse!;

          final String? userId = selectedSearchUserResponse.user?.id;

          final String name =
              selectedSearchUserResponse.user?.name ?? 'the staff member';

          return (vm.wait.isWaitingFor(searchStaffMemberFlag))
              ? Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                )
              : Column(
                  children: <Widget>[
                    SearchDetailsInformationWidget(
                      searchUserResponse: selectedSearchUserResponse,
                      isClient: false,
                    ),
                    smallVerticalSizedBox,
                    const Divider(),
                    smallVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ActiveStaffActions(
                            names: name,
                            isSendLoading:
                                vm.wait.isWaitingFor(inviteStaffFlag),
                            isResendLoading:
                                vm.wait.isWaitingFor(reinviteStaffFlag),
                            searchUserResponse: selectedSearchUserResponse,
                          ),

                          mediumVerticalSizedBox,
                          const Divider(),
                          smallVerticalSizedBox,

                          // User roles section
                          Text(
                            userRoles,
                            style: boldSize18Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          Wrap(
                            children: roleFields.entries
                                .where(
                              (MapEntry<RoleValue, bool> element) =>
                                  element.key !=
                                      RoleValue.COMMUNITY_MANAGEMENT &&
                                  element.key != RoleValue.CONTENT_MANAGEMENT,
                            )
                                .map<Widget>((MapEntry<RoleValue, bool> entry) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RoleListItemWidget(
                                  title: capitalizeFirst(entry.key.name),
                                  description:
                                      permissions[0]['description'] ?? '',
                                ),
                              );
                            }).toList(),
                          ),
                          mediumVerticalSizedBox,
                          SizedBox(
                            width: double.infinity,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: addRoleButtonKey,
                              customChild:
                                  (vm.wait.isWaitingFor(assignRolesFlag))
                                      ? const PlatformLoader()
                                      : Text(
                                          addRoleString,
                                          style: veryBoldSize15Text(
                                            AppColors.whiteColor,
                                          ),
                                        ),
                              onPressed: () {
                                final List<RoleValue> newPermissions =
                                    roleFields.keys
                                        .where(
                                          (RoleValue role) =>
                                              roleFields[role] ?? false,
                                        )
                                        .toList();

                                StoreProvider.dispatch(
                                  context,
                                  AssignRolesAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    userId: userId,
                                    roles: newPermissions,
                                    onFailure: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(genericErrorOccurred),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    noPermissionsCallBack: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(youDoNotHavePermission),
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    onSuccess: () {
                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: '$rolesAssigned $name',
                                      );

                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          largeVerticalSizedBox,
                          LinkedFacilitiesWidget(
                            userId: selectedSearchUserResponse.id ?? '',
                            userName:
                                selectedSearchUserResponse.user?.name ?? '',
                            defaultFacility:
                                selectedSearchUserResponse.defaultFacility,
                            isClient: false,
                          ),
                          mediumVerticalSizedBox,
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
