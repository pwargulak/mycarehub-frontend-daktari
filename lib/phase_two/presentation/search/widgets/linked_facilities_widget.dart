import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:app_wrapper/app_wrapper.dart';

import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';

import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';

import 'package:prohealth360_daktari/application/redux/actions/facilities/fetch_user_linked_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/remove_facility_from_client_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/remove_facility_from_staff_profile_action.dart';

import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';

import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';

import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

import 'package:prohealth360_daktari/phase_two/presentation/widgets/list_card_with_cancel_button.dart';

import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';

class LinkedFacilitiesWidget extends StatelessWidget {
  const LinkedFacilitiesWidget({
    super.key,
    this.isClient = true,
    required this.userId,
    required this.userName,
  });

  final bool isClient;
  final String userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ListFacilitiesViewModel>(
      converter: (Store<AppState> store) =>
          ListFacilitiesViewModel.fromStore(store),
      onInit: (Store<AppState> store) => store.dispatch(
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
        ),
      ),
      builder: (BuildContext context, ListFacilitiesViewModel vm) {
        final List<Facility> facilities = vm.linkedFacilities ?? <Facility>[];

        final List<Widget> facilitiesWidgetList = <Widget>[];

        if (facilities.isNotEmpty) {
          facilities
              .map(
                (Facility? facility) => facilitiesWidgetList.add(
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: vm.wait.isWaitingFor(
                      '${facility?.id ?? ''}_$removeFacilityFlag',
                    )
                        ? const PlatformLoader()
                        : ListCardWithCancelButton(
                            title: facility?.name ?? '',
                            description: facility?.code?.toString(),
                            onCancelCallback: () {
                              if (isClient) {
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  RemoveFacilityFromClientProfileAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
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
                                    onSuccess: () =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text(removedFacilitySuccessString),
                                        duration: Duration(
                                          seconds: kShortSnackBarDuration,
                                        ),
                                      ),
                                    ),
                                    clientId: userId,
                                    facilityId: facility?.id ?? '',
                                  ),
                                );
                              } else {
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  RemoveFacilityFromStaffProfileAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
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
                                    onSuccess: () =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text(removedFacilitySuccessString),
                                        duration: Duration(
                                          seconds: kShortSnackBarDuration,
                                        ),
                                      ),
                                    ),
                                    staffId: userId,
                                    facilityId: facility?.id ?? '',
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ),
              )
              .toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              facilitiesString,
              style: boldSize18Text(AppColors.greyTextColor),
            ),
            smallVerticalSizedBox,
            if (vm.wait.isWaitingFor(retrieveFacilityFlag))
              const PlatformLoader()
            else ...<Widget>{
              Text(
                getFacilitiesDescriptionString(
                  userName,
                ),
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              ...facilitiesWidgetList,
              smallVerticalSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: addFacilityButtonKey,
                  onPressed: () {
                    StoreProvider.dispatch<AppState>(
                      context,
                      BatchUpdateMiscStateAction(
                        updateFacility: true,
                      ),
                    );

                    Navigator.of(context).pushNamed(
                      AppRoutes.searchFacilitiesPage,
                      arguments: <String, dynamic>{
                        'userID': userId,
                        'isClient': isClient,
                      },
                    );
                  },
                  text: addFacilityString,
                ),
              ),
            },
            largeVerticalSizedBox,
          ],
        );
      },
    );
  }
}
