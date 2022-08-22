import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/surveys/surveys_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/survey_service_request_item_widget.dart';

class SurveyServiceRequestsPage extends StatelessWidget {
  const SurveyServiceRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: surveyServiceRequestsString),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StoreConnector<AppState, SurveysViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                UpdateSurveyStateAction(
                  surveys: <Survey>[
                    Survey(name: phq9String),
                    Survey(name: mentalHealthSurveyString)
                  ],
                ),
              );
            },
            converter: (Store<AppState> store) =>
                SurveysViewModel.fromStore(store),
            builder: (BuildContext context, SurveysViewModel vm) {
              final bool error = vm.errorFetchingSurveys ?? false;
              final bool isLoading =
                  vm.wait?.isWaitingFor(fetchSurveysFlag) ?? false;
              final List<Survey?> surveys = vm.surveys ?? <Survey?>[];

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    if (!error) ...<Widget>{
                      Center(child: SvgPicture.asset(surveysImagePath)),
                      const SizedBox(
                        height: 20,
                      ),
                      if (!isLoading) ...<Widget>{
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
                            );
                          },
                        )
                    } else
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        recoverCallback: () {
                          StoreProvider.dispatch(
                            context,
                            FetchServiceRequestsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              serviceRequestStatus: RequestStatus.PENDING,
                              serviceRequestType: ServiceRequestType.PIN_RESET,
                              flavour: Flavour.consumer,
                            ),
                          );
                        },
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(
                            text:
                                getErrorMessage(fetchingPINResetRequestsString),
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
