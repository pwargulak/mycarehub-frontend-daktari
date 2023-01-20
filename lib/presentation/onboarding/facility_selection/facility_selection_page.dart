import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/fetch_staff_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/facilities_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/summary_badge_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/set_staff_default_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
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
            child: StoreConnector<AppState, FacilitiesStateViewModel>(
              converter: (Store<AppState> store) =>
                  FacilitiesStateViewModel.fromStore(store),
              onInit: (Store<AppState> store) {
                store.dispatch(
                  UpdateUserProfileAction(
                    currentFacility: Facility.initial(),
                  ),
                );
                store.dispatch(
                  FetchStaffFacilitiesAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              },
              builder: (BuildContext context, FacilitiesStateViewModel vm) {
                final List<Facility>? facilities = vm.programFacilities;
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

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(workStationChooserImage),
                    ),
                    if (vm.errorGettingFacilities ?? false)
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        type: GenericNoDataTypes.noData,
                        recoverCallback: () => StoreProvider.dispatch(
                          context,
                          FetchStaffFacilitiesAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                          ),
                        ),
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getErrorMessage(
                              fetchingProgramFacilitiesString,
                            ),
                          )
                        ],
                      )
                    else if (vm.wait.isWaitingFor(fetchProgramFacilitiesFlag))
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        child: const PlatformLoader(),
                      )
                    else if (facilities?.isNotEmpty ?? false) ...<Widget>{
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
                    } else ...<Widget>{
                      veryLargeVerticalSizedBox,
                      Text(
                        noProgramFacilitiesString,
                        style: boldSize20Text(
                          AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      )
                    }
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
