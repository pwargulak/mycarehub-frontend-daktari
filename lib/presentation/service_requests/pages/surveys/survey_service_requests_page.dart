import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_survey_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/survey_service_request_item_widget.dart';

class SurveyServiceRequestsPage extends StatelessWidget {
  const SurveyServiceRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: surveyServiceRequestsString),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StoreConnector<AppState, ServiceRequestsViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchSurveyServiceRequestsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                ),
              );
            },
            converter: (Store<AppState> store) =>
                ServiceRequestsViewModel.fromStore(store),
            builder: (BuildContext context, ServiceRequestsViewModel vm) {
              final SurveyServiceRequestState? surveyState =
                  vm.surveyServiceRequestState;
              final bool error = surveyState?.errorFetchingSurveys ?? false;
              final bool isLoading = vm.wait.isWaitingFor(fetchSurveysFlag);
              final List<SurveyServiceRequestItem?> surveys =
                  surveyState?.surveys ?? <SurveyServiceRequestItem?>[];

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    if (!error) ...<Widget>{
                      Center(child: SvgPicture.asset(surveysImagePath)),
                      const SizedBox(
                        height: 20,
                      ),
                      if (!isLoading && surveys.isNotEmpty) ...<Widget>{
                        const Text(
                          surveyServiceRequestsLeadingString,
                          style: TextStyle(color: AppColors.grey50),
                        ),
                        mediumVerticalSizedBox,
                      },
                      if (isLoading)
                        const PlatformLoader()
                      else if (surveys.isEmpty)
                        GenericErrorWidget(
                          actionText: actionTextGenericNoData,
                          recoverCallback: () => Navigator.of(context).pop(),
                          type: GenericNoDataTypes.noData,
                          messageTitle: getNoDataTile('service requests'),
                          messageBody: <TextSpan>[
                            TextSpan(
                              text: serviceRequestsNoDataBodyString,
                              style: normalSize16Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                          ],
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: surveys.length,
                          itemBuilder: (_, int index) {
                            final String surveyTitle =
                                surveys[index]?.name ?? '';
                            return SurveyServiceRequestItemWidget(
                              title: surveyTitle,
                              description: getSurveyServiceRequestActionString(
                                surveyTitle,
                              ),
                              onTapCallback: () => Navigator.pushNamed(
                                context,
                                AppRoutes.surveyServiceRequestResponsesPage,
                                arguments: surveys[index],
                              ),
                            );
                          },
                        )
                    } else
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        recoverCallback: () {
                          StoreProvider.dispatch(
                            context,
                            FetchSurveyServiceRequestsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                            ),
                          );
                        },
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getErrorMessage(fetchingSurveysString),
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
