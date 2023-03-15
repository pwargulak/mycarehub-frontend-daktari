import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/programs_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class ProgramDetailPage extends StatelessWidget {
  const ProgramDetailPage({super.key});
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, ProgramsStateViewModel>(
      converter: (Store<AppState> store) =>
          ProgramsStateViewModel.fromStore(store),
      builder: (BuildContext context, ProgramsStateViewModel vm) {
        final Program? selectedProgram = vm.selectedPrograms?.first;
        return Scaffold(
          appBar: CustomAppBar(
            title: programName(selectedProgram?.name ?? ''),
            showNotificationIcon: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    mediumVerticalSizedBox,
                    Center(
                      child: SvgPicture.asset(serviceRequestsIconSvg),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      selectedProgram?.name ?? '',
                      style: heavySize18Text(AppColors.blackColor),
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      selectedProgram?.description ?? '',
                      style: normalSize14Text(AppColors.greyTextColor),
                      textAlign: TextAlign.center,
                    ),
                    mediumVerticalSizedBox,
                    const Divider(),
                    verySmallVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            organizationString,
                            style: heavySize16Text(AppColors.blackColor),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            selectedProgram?.organisation?.description ?? '',
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          mediumVerticalSizedBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                facilitiesString,
                                style: heavySize16Text(AppColors.blackColor),
                              ),
                              smallVerticalSizedBox,
                              Text(
                                runningFacilitiesString,
                                style:
                                    normalSize14Text(AppColors.greyTextColor),
                              ),
                              smallVerticalSizedBox,
                              if (selectedProgram?.facilities?.isNotEmpty ??
                                  false)
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      selectedProgram?.facilities?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProgramListItem(
                                      title: selectedProgram!
                                              .facilities?[index]?.name ??
                                          '',
                                      description: selectedProgram
                                              .facilities?[index]
                                              ?.description ??
                                          '',
                                      onCancel: () {},
                                    );
                                  },
                                ),
                              mediumVerticalSizedBox,
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: MyAfyaHubPrimaryButton(
                                  borderColor: Colors.transparent,
                                  buttonKey: addFacilityButtonKey,
                                  text: addFacilityString,
                                  onPressed: () =>
                                      Navigator.of(context).pushNamed(
                                    AppRoutes.searchFacilitiesPage,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
