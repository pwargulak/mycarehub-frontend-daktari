import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/fetch_survey_respondents_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/surveys/surveys_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_respondent_item_card.dart';

class SurveyRespondentsPage extends StatefulWidget {
  const SurveyRespondentsPage({super.key, required this.selectedSurvey});

  final Survey selectedSurvey;

  @override
  State<SurveyRespondentsPage> createState() => _SurveyRespondentsPageState();
}

class _SurveyRespondentsPageState extends State<SurveyRespondentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.selectedSurvey.name,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, SurveysViewModel>(
        converter: (Store<AppState> store) => SurveysViewModel.fromStore(store),
        onInit: (Store<AppState> store) {
          StoreProvider.dispatch(
            context,
            FetchSurveyRespondentsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              projectID: widget.selectedSurvey.projectId ?? 0,
              formID: widget.selectedSurvey.xmlFormId ?? '',
            ),
          );
        },
        builder: (BuildContext context, SurveysViewModel vm) {
          final List<SurveyRespondent?> surveyResponses =
              vm.surveyRespondents ?? <SurveyRespondent>[];
          final List<Widget> surveysWidgetList = <Widget>[];

          if (surveyResponses.isNotEmpty) {
            surveyResponses
                .map(
                  (SurveyRespondent? response) => surveysWidgetList.add(
                    SurveyRespondentItemCard(
                      title: response?.name ?? '',
                      onTapCallback: () => Navigator.pushNamed(
                        context,
                        AppRoutes.surveyResponsesPreviewPage,
                        arguments: <String, dynamic>{
                          'surveyRespondent': response,
                          'surveyName': widget.selectedSurvey.name,
                        },
                      ),
                    ),
                  ),
                )
                .toList();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (vm.wait!.isWaitingFor(fetchSurveyRespondentsFlag))
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      child: const PlatformLoader(),
                    )
                  else if (surveyResponses.isEmpty)
                    GenericErrorWidget(
                      headerIconSvgUrl: contentZeroStateImageUrl,
                      actionKey: helpNoDataWidgetKey,
                      messageTitle: noResponsesTitle,
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: noResponsesDescription,
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                      recoverCallback: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.surveysPage,
                        );
                      },
                      actionText: thanksText,
                    )
                  else
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(child: SvgPicture.asset(screeningToolsImage)),
                        mediumVerticalSizedBox,
                        Text(
                          responsesForTheSurvey,
                          style: normalSize14Text(AppColors.grey50),
                        ),
                        mediumVerticalSizedBox,
                        ...surveysWidgetList,
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
