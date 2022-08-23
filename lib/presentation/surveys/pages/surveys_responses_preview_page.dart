import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/surveys/surveys_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_preview_response_item.dart';

class SurveyResponsesPreviewPage extends StatelessWidget {
  final Survey survey;
  const SurveyResponsesPreviewPage({
    Key? key,
    required this.survey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "${survey.name}'s $responseString"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StoreConnector<AppState, SurveysViewModel>(
            converter: (Store<AppState> store) =>
                SurveysViewModel.fromStore(store),
            onInit: (Store<AppState> store) => store.dispatch(
              UpdateSurveyStateAction(
                surveyResponses: dummySurveyResponses,
              ),
            ),
            builder: (BuildContext context, SurveysViewModel vm) {
              final bool error = vm.errorFetchingSurveys ?? false;
              final bool isLoading =
                  vm.wait?.isWaitingFor(fetchSurveyResponsesFlag) ?? false;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (!error) ...<Widget>{
                      Text(
                        phq9String,
                        style:
                            veryBoldSize16Text(AppColors.lightBlackTextColor),
                      ),
                      mediumVerticalSizedBox,
                      Text(
                        getSurveyPreviewDescriptionText(phq9String),
                        style: normalSize14Text(darkGreyTextColor),
                      ),
                      if (isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: PlatformLoader(),
                          ),
                        )
                      else if (vm.surveyResponses?.isNotEmpty ??
                          false) ...<Widget>{
                        largeVerticalSizedBox,
                        ...List<Widget>.generate(vm.surveyResponses!.length,
                            (int index) {
                          final String question =
                              vm.surveyResponses![index]?.question ?? '';

                          final List<String> answers =
                              vm.surveyResponses?[index]?.answers ?? <String>[];

                          return SurveyPreviewResponseItem(
                            question: question,
                            answers: answers,
                            index: index,
                          );
                        }),
                      }
                    }
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
