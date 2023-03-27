import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/survey_service_request_item_widget.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_survey_service_request_respondents_action.dart';

class SurveyServiceRequestResponsesPage extends StatelessWidget {
  final SurveyServiceRequestItem? selectedSurvey;
  const SurveyServiceRequestResponsesPage({
    super.key,
    this.selectedSurvey,
  });

  @override
  Widget build(BuildContext context) {
    final String surveyTitle = selectedSurvey?.name ?? '';
    return Scaffold(
      appBar: CustomAppBar(
        title: getSurveyResponsesAppBarTitle(surveyTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StoreConnector<AppState, ServiceRequestsViewModel>(
            converter: (Store<AppState> store) =>
                ServiceRequestsViewModel.fromStore(store),
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchSurveyRespondentsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  projectID: selectedSurvey?.projectId ?? 0,
                  formID: selectedSurvey?.xmlFormId ?? '',
                ),
              );
            },
            builder: (BuildContext context, ServiceRequestsViewModel vm) {
              final bool error =
                  vm.surveyServiceRequestState?.errorFetchingSurveys ?? false;
              final bool isLoading =
                  vm.wait.isWaitingFor(fetchSurveyResponsesFlag);

              final List<SurveyRespondent?>? respondents = vm
                  .surveyServiceRequestState
                  ?.surveyServiceRequestRespondentsState
                  ?.surveyRespondents;

              return RefreshIndicator(
                onRefresh: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    FetchSurveyRespondentsAction(
                      client: AppWrapperBase.of(context)!.graphQLClient,
                      projectID: selectedSurvey?.projectId ?? 0,
                      formID: selectedSurvey?.xmlFormId ?? '',
                    ),
                  );
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      if (!error) ...<Widget>{
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                screeningToolsImage,
                                width: 200,
                              ),
                              mediumVerticalSizedBox,
                              if (!isLoading) ...<Widget>{
                                Text(
                                  getSurveyResponsesPageDescString(
                                    surveyTitle,
                                  ),
                                  style: normalSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              },
                            ],
                          ),
                        ),
                        if (isLoading) ...<Widget>{
                          const Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: PlatformLoader(),
                          )
                        } else if (respondents?.isEmpty ?? true) ...<Widget>{
                          GenericErrorWidget(
                            actionKey: helpNoDataWidgetKey,
                            actionText: actionTextGenericNoData,
                            type: GenericNoDataTypes.noData,
                            recoverCallback: () => Navigator.of(context).pop(),
                            messageTitle: getNoDataTile(
                              getSurveyResponsesAppBarTitle(surveyTitle),
                            ),
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: serviceRequestsNoDataBodyString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                            ],
                          )
                        } else
                          ...List<Widget>.generate(respondents!.length,
                              (int index) {
                            final String clientName =
                                respondents[index]?.name ?? '';

                            return SurveyServiceRequestItemWidget(
                              onTapCallback: () =>
                                  Navigator.of(context).pushNamed(
                                AppRoutes.surveyServiceRequestActionsPage,
                                arguments: respondents.elementAt(index),
                              ),
                              title: clientName,
                              description: tapToViewResponseString,
                            );
                          }),
                      } else ...<Widget>{
                        GenericErrorWidget(
                          actionKey: helpNoDataWidgetKey,
                          recoverCallback: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchServiceRequestsAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                serviceRequestStatus: RequestStatus.PENDING,
                                serviceRequestType:
                                    ServiceRequestType.SURVEY_RED_FLAG,
                                flavour: Flavour.consumer,
                              ),
                            );
                          },
                          messageTitle: '',
                          messageBody: <TextSpan>[
                            TextSpan(
                              text: getErrorMessage(
                                fetchingSurveyResponsesString,
                              ),
                              style: normalSize16Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                          ],
                        )
                      },
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
