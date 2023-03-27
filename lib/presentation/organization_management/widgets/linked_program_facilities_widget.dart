import 'package:prohealth360_daktari/application/redux/actions/programs/fetch_program_facilities_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';

import 'package:prohealth360_daktari/presentation/router/routes.dart';

class LinkedProgramFacilitiesWidget extends StatelessWidget {
  const LinkedProgramFacilitiesWidget({
    super.key,
    required this.programId,
  });

  final String programId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ListFacilitiesViewModel>(
      converter: (Store<AppState> store) =>
          ListFacilitiesViewModel.fromStore(store),
      onInit: (Store<AppState> store) => store.dispatch(
        FetchProgramFacilitiesAction(
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
          programId: programId,
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
                            description:
                                facility?.facilityIdentifier?.value?.toString(),
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
              style: heavySize16Text(AppColors.blackColor),
            ),
            smallVerticalSizedBox,
            if (vm.wait.isWaitingFor(retrieveFacilityFlag))
              const PlatformLoader()
            else ...<Widget>{
              Text(
                runningFacilitiesString,
                style: normalSize14Text(AppColors.greyTextColor),
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
                        'programId': programId,
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
