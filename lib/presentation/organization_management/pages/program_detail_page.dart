import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/programs_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/linked_program_facilities_widget.dart';
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
                          LinkedProgramFacilitiesWidget(
                            programId: selectedProgram?.id ?? '',
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
