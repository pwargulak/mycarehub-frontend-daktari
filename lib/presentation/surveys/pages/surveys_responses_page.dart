import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_response_state.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/surveys/surveys_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_reponse_item_card.dart';

class SurveyResponsesPage extends StatelessWidget {
  const SurveyResponsesPage({Key? key, required this.appBarTitle})
      : super(key: key);

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle, showNotificationIcon: true),
      body: StoreConnector<AppState, SurveysViewModel>(
        onInit: (Store<AppState> store) {
          StoreProvider.dispatch(
            context,
            UpdateSurveyResponseStateAction(
              errorOccurred: false,
              timeOutOccurred: false,
            ),
          );
        },
        converter: (Store<AppState> store) => SurveysViewModel.fromStore(store),
        builder: (BuildContext context, SurveysViewModel vm) {
          final List<SurveyResponse?> surveyResponses =
              vm.surveyResponses ?? <SurveyResponse>[];
          final List<Widget> surveysWidgetList = <Widget>[];

          if (surveyResponses.isNotEmpty) {
            surveyResponses
                .map(
                  (SurveyResponse? response) => surveysWidgetList.add(
                    SurveyResponseItemCard(
                      title: response?.name ?? '',
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
                  if (surveyResponses.isEmpty)
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
