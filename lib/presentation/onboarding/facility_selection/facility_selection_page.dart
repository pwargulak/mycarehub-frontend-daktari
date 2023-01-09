import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/summary_badge_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/fetch_user_linked_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/set_staff_default_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';

class FacilitySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, ListFacilitiesViewModel>(
              converter: (Store<AppState> store) =>
                  ListFacilitiesViewModel.fromStore(store),
              onInit: (Store<AppState> store) {
                final String userId = StoreProvider.state<AppState>(context)
                        ?.userProfileState
                        ?.userProfile
                        ?.id ??
                    '';
                store.dispatch(
                  UpdateStaffProfileAction(
                    currentFacility: Facility.initial(),
                  ),
                );
                store.dispatch(
                  FetchUserLinkedFacilitiesAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    onFailure: (String message) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              message,
                            ),
                            duration: const Duration(
                              seconds: 5,
                            ),
                            action: dismissSnackBar(
                              closeString,
                              Colors.white,
                              context,
                            ),
                          ),
                        );
                    },
                    userId: userId,
                    shouldNavigate: true,
                  ),
                );
              },
              builder: (BuildContext context, ListFacilitiesViewModel vm) {
                final List<Facility>? facilities = vm.linkedFacilities;
                final List<Widget> facilitiesWidgetList = <Widget>[];

                if (facilities?.isNotEmpty ?? false) {
                  for (final Facility facility in facilities!) {
                    final int messagesCount =
                        facility.workStationDetails?.messages ?? 0;

                    final int notificationsCount =
                        facility.workStationDetails?.notifications ?? 0;

                    final int serviceRequestsCount =
                        facility.workStationDetails?.serviceRequests ?? 0;

                    final List<Widget> badgesList = <Widget>[];
                    if (messagesCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title: '${messagesCount.toString()} messages',
                          iconUrl: surveysIcon,
                        ),
                      );
                    }
                    if (notificationsCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title:
                              '${notificationsCount.toString()} notifications',
                          iconUrl: notificationSvgIconPath,
                        ),
                      );
                    }

                    if (serviceRequestsCount > 0) {
                      badgesList.add(
                        SummaryBadgeWidget(
                          title:
                              '${serviceRequestsCount.toString()} service requests',
                          iconUrl: serviceRequestIcon,
                        ),
                      );
                    }
                    facilitiesWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: GeneralWorkstationWidget(
                          title: facility.name ?? '',
                          bodyWidget: Wrap(
                            runSpacing: 12,
                            spacing: 8,
                            children: badgesList,
                          ),
                          buttonText: continueString,
                          onButtonCallback: () async {
                            await StoreProvider.dispatch(
                              context,
                              SetStaffDefaultFacilityAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                facilityId: facility.id ?? '',
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }
                if (vm.wait.isWaitingFor(retrieveFacilityFlag)) {
                  return Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: const PlatformLoader(),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        key: const Key('workStationChooserImage'),
                        child: SvgPicture.asset(workStationChooserImage),
                      ),
                      smallVerticalSizedBox,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (vm.wait.isWaitingFor(setDefaultFacilityFlag))
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  switchingYourFacility,
                                  style: boldSize18Text(),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: PlatformLoader(),
                                  ),
                                )
                              ],
                            )
                          else
                            Column(
                              children: <Widget>[
                                Text(
                                  selectFacilityString,
                                  style: boldSize20Text(
                                    AppColors.primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                Text(
                                  welcomeFacilitySelectionDescription(
                                    facilities?.length ?? 0,
                                  ),
                                  style: normalSize14Text(
                                    AppColors.unSelectedReactionIconColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                smallVerticalSizedBox,
                                ...facilitiesWidgetList,
                              ],
                            ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
