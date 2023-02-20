import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/update_facilities_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/fetch_user_programs_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/programs_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/presentation/onboarding/program_selection/widgets/programs_widget_list.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ProgramSelectionPage extends StatelessWidget {
  final IGraphQlClient? graphQlClient;

  const ProgramSelectionPage({this.graphQlClient});
  @override
  Widget build(BuildContext context) {
    final String userId = StoreProvider.state<AppState>(context)
            ?.userProfileState
            ?.userProfile
            ?.user
            ?.userId ??
        '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, ProgramsStateViewModel>(
              converter: (Store<AppState> store) =>
                  ProgramsStateViewModel.fromStore(store),
              onInit: (Store<AppState> store) {
                store.dispatch(
                  UpdateFacilitiesStateAction(
                    selectedFacility: Facility.initial(),
                  ),
                );
                store.dispatch(
                  FetchUserProgramsAction(
                    client: getCustomClient(
                      context: context,
                      graphQlClient: graphQlClient,
                    ),
                    userId: userId,
                  ),
                );
              },
              builder: (BuildContext context, ProgramsStateViewModel vm) {
                final List<Program>? programs = vm.userPrograms;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(programAmicoImage),
                    ),
                    if (vm.errorGettingPrograms ?? false) ...<Widget>{
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        type: GenericNoDataTypes.noData,
                        recoverCallback: () => StoreProvider.dispatch(
                          context,
                          FetchUserProgramsAction(
                            client: getCustomClient(
                              context: context,
                              graphQlClient: graphQlClient,
                            ),
                            userId: userId,
                          ),
                        ),
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(text: getErrorMessage(fetchingProgramString))
                        ],
                      ),
                      smallVerticalSizedBox,
                      Text(
                        'or',
                        style: boldSize18Text(),
                      ),
                      mediumVerticalSizedBox,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          buttonKey: logoutButtonKey,
                          onPressed: () {
                            StoreProvider.dispatch(
                              context,
                              LogoutAction(),
                            );
                          },
                          text: logoutButtonText,
                          textColor: AppColors.primaryColor,
                          borderColor: Colors.transparent,
                          buttonColor: AppColors.primaryColor.withOpacity(0.14),
                        ),
                      ),
                    } else if (vm.wait.isWaitingFor(fetchUserProgramsFlag))
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        child: const PlatformLoader(),
                      )
                    else if (programs?.isNotEmpty ?? false) ...<Widget>{
                      Text(
                        selectProgramString,
                        style: boldSize20Text(
                          AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      smallVerticalSizedBox,
                      if (vm.wait.isWaitingFor(setUserProgramFlag))
                        const Padding(
                          padding: EdgeInsets.only(top: 60.0),
                          child: PlatformLoader(),
                        )
                      else
                        ProgramsListWidget(
                          programs: programs!,
                          graphQlClient: getCustomClient(
                            context: context,
                            graphQlClient: graphQlClient,
                          ),
                        ),
                      mediumVerticalSizedBox,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          buttonKey: logoutButtonKey,
                          onPressed: () {
                            StoreProvider.dispatch(
                              context,
                              LogoutAction(),
                            );
                          },
                          text: logoutButtonText,
                          textColor: AppColors.primaryColor,
                          borderColor: Colors.transparent,
                          buttonColor: AppColors.primaryColor.withOpacity(0.14),
                        ),
                      ),
                    } else ...<Widget>{
                      largeVerticalSizedBox,
                      Text(
                        noProgramsString,
                        style: boldSize20Text(
                          AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      size40VerticalSizedBox,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => StoreProvider.dispatch(
                            context,
                            LogoutAction(),
                          ),
                          child: const Text(logoutButtonText),
                        ),
                      ),
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
