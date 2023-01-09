import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/fetch_user_programs_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/programs_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';

class ProgramSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, ProgramsStateViewModel>(
              converter: (Store<AppState> store) =>
                  ProgramsStateViewModel.fromStore(store),
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
                  FetchUserProgramsAction(
                    client: AppWrapperBase.of(context)!.graphQLClient
                        as CustomClient,
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
                );
              },
              builder: (BuildContext context, ProgramsStateViewModel vm) {
                final List<Program>? programs = vm.userPrograms;
                final List<Widget> programsWidgetList = <Widget>[];

                if (programs?.isNotEmpty ?? false) {
                  for (final Program program in programs!) {
                    programsWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: GeneralWorkstationWidget(
                          title: program.name ?? '',
                          bodyWidget: Wrap(
                            runSpacing: 12,
                            spacing: 8,
                          ),
                          buttonText: proceedText,
                          onButtonCallback: () =>
                              Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.homePage,
                            (Route<dynamic> route) => false,
                          ),
                        ),
                      ),
                    );
                  }
                }
                if (vm.wait.isWaitingFor(fetchUserProgramsFlag)) {
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
                        child: SvgPicture.asset(programAmicoImage),
                      ),
                      smallVerticalSizedBox,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                selectProgramString,
                                style: boldSize20Text(
                                  AppColors.primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              smallVerticalSizedBox,
                              ...programsWidgetList,
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
