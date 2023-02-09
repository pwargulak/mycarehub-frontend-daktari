import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/list_organisations_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/search_organisations_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/organisations_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/organization_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ManageOrganizationPage extends StatefulWidget {
  const ManageOrganizationPage();
  @override
  State<ManageOrganizationPage> createState() => _ManageOrganizationPageState();
}

class _ManageOrganizationPageState extends State<ManageOrganizationPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: manageOrganizationString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: StoreConnector<AppState, OrganisationsStateViewModel>(
          converter: (Store<AppState> store) =>
              OrganisationsStateViewModel.fromStore(store),
          onInit: (Store<AppState> store) {
            store.dispatch(
              ListOrganisationsAction(
                client: AppWrapperBase.of(context)!.graphQLClient,
              ),
            );
          },
          builder: (BuildContext context, OrganisationsStateViewModel vm) {
            if (vm.wait.isWaitingFor(listOrganizationsFlag) ||
                vm.wait.isWaitingFor(searchOrganizationsFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          searchOrganizationTextString,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          hintText: searchOrganizationHintString,
                          controller: searchController,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: IconButton(
                              key: searchOrganizationButtonKey,
                              onPressed: () {
                                StoreProvider.dispatch(
                                  context,
                                  SearchOrganisationsAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    query: searchController.text,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor:
                              AppColors.primaryColor.withOpacity(0.15),
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          mostViewedOrganizationString,
                          style: boldSize16Text(AppColors.greyTextColor),
                        ),
                        mediumVerticalSizedBox,
                        if (vm.organisations?.isNotEmpty ?? false)
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: vm.organisations!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: OrganizationListItem(
                                  description:
                                      vm.organisations![index].description ??
                                          '',
                                  title: vm.organisations![index].name ?? '',
                                  onTap: () {
                                    StoreProvider.dispatch(
                                      context,
                                      UpdateOrganisationsStateAction(
                                        selectedOrganisation:
                                            vm.organisations![index],
                                      ),
                                    );
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.organizationDetailPageRoute,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    borderColor: Colors.transparent,
                    text: createOrganizationString,
                    buttonKey: createOrganizationButtonKey,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.createOrganizationRoute);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
