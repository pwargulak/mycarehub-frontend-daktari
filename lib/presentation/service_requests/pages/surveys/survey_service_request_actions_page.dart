import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_survey_service_request.action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/reach_out_widget.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/surveys_card.dart';

class SurveyServiceRequestActionsPage extends StatefulWidget {
  const SurveyServiceRequestActionsPage({super.key, this.surveyRespondent});

  final SurveyRespondent? surveyRespondent;

  @override
  State<SurveyServiceRequestActionsPage> createState() =>
      _SurveyServiceRequestActionsPageState();
}

class _SurveyServiceRequestActionsPageState
    extends State<SurveyServiceRequestActionsPage> {
  Map<String, bool> actionsList = <String, bool>{
    noFurtherActionRequiredString: false,
    followUpVisitBookedString: false,
    referredToCommunityString: false,
  };

  List<String> actionsTaken = <String>[];
  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    final TextEditingController actionInputController = TextEditingController();

    final String phoneNumber = widget.surveyRespondent?.phoneNumber ?? '';
    final String clientName = widget.surveyRespondent?.name ?? '';
    final UserProfile? userProfileState =
        StoreProvider.state<AppState>(context)?.userProfileState;
    final String staffFirstName = userProfileState?.user?.firstName ?? '';
    final String staffLastName = userProfileState?.user?.lastName ?? '';
    final String facilityName = userProfileState?.defaultFacilityName ?? '';

    final String surveyName = widget.surveyRespondent?.surveyName ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: surveyResponseString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              smallVerticalSizedBox,
              Text(
                '$surveyName ${responseString.toLowerCase()} from $clientName',
                style: veryBoldSize16Text(AppColors.lightBlackTextColor),
              ),
              mediumVerticalSizedBox,
              SurveysCard(
                title: '$surveyName $responseString',
                message: getSurveyActionCardMessageString(
                  clientName,
                ),
                primaryButtonKey: mentalHealthSurveyButtonKey,
                primaryButtonText: previewResponsesString,
                onPrimaryButtonPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.surveyResponsesPreviewPage,
                  arguments: <String, dynamic>{
                    'surveyRespondent': widget.surveyRespondent,
                    'surveyName': widget.surveyRespondent?.surveyName ?? '',
                  },
                ),
              ),
              largeVerticalSizedBox,
              ReachOutWidget(
                platform: platform,
                phoneNumber: phoneNumber,
                clientName: clientName,
                staffFirstName: staffFirstName,
                staffLastName: staffLastName,
                facilityName: facilityName,
              ),
              mediumVerticalSizedBox,
              Text(
                resolveString,
                style: veryBoldSize18Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: ifYouHaveReachedOutString,
                  style: normalSize16Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: clientName,
                      style: veryBoldSize16Text(AppColors.greyTextColor),
                    ),
                    const TextSpan(
                      text: tapTapBelowToResolveString,
                    ),
                  ],
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                actionTakenString,
                style: veryBoldSize18Text(AppColors.greyTextColor),
              ),
              ...getActionsCheckBoxes(actionsList),
              mediumVerticalSizedBox,
              Text(
                notesString,
                style: veryBoldSize18Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              TextField(
                key: serviceRequestNotesTextFieldKey,
                keyboardType: TextInputType.visiblePassword,
                controller: actionInputController,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
                maxLines: 9,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: describeActionTakenString,
                  hintStyle: normalSize14Text(
                    AppColors.greyTextColor.withOpacity(0.4),
                  ),
                  filled: true,
                  fillColor: AppColors.galleryColor,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusColor: AppColors.greyTextColor,
                ),
              ),
              mediumVerticalSizedBox,
              StoreConnector<AppState, ServiceRequestsViewModel>(
                converter: (Store<AppState> store) =>
                    ServiceRequestsViewModel.fromStore(store),
                builder: (BuildContext context, ServiceRequestsViewModel vm) {
                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: vm.wait.isWaitingFor(resolveServiceRequestFlag)
                        ? const PlatformLoader()
                        : ElevatedButton(
                            key: resolveRequestButtonKey,
                            onPressed: actionsTaken.isNotEmpty
                                ? () => StoreProvider.dispatch<AppState>(
                                      context,
                                      ResolveSurveyServiceRequestAction(
                                        client: AppWrapperBase.of(context)!
                                            .graphQLClient,
                                        serviceRequestId: widget
                                                .surveyRespondent
                                                ?.serviceRequestID ??
                                            '',
                                        comments: actionInputController.text,
                                        actionsTaken: actionsTaken.contains(
                                          noFurtherActionRequiredString,
                                        )
                                            ? <String>[]
                                            : actionsTaken,
                                        onSuccess: () {
                                          showTextSnackbar(
                                            ScaffoldMessenger.of(context),
                                            content: requestResolvedSuccessText,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        onFailure: () => showTextSnackbar(
                                          ScaffoldMessenger.of(context),
                                          content: somethingWentWrongText,
                                        ),
                                      ),
                                    )
                                : null,
                            child: const Text(
                              resolveString,
                            ),
                          ),
                  );
                },
              ),
              largeVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getActionsCheckBoxes(Map<String, bool> actions) {
    final List<Widget> result = <Widget>[];

    actions.forEach((String key, bool value) {
      result.add(
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          key: ValueKey<String>(key.replaceAll(' ', '_').toLowerCase()),
          activeColor: Theme.of(context).primaryColor,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            key,
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            setState(() {
              actionsList[key] = !value;
              if (key == noFurtherActionRequiredString) {
                if (actionsList[key] ?? false) {
                  actionsTaken = <String>[noFurtherActionRequiredString];
                  actionsList.forEach((String key, bool value) {
                    if (key != key) actionsList[key] = false;
                  });
                } else {
                  actionsTaken = <String>[];
                }
              } else {
                if (actionsList[key] ?? false) {
                  actionsTaken.add(key);
                  actionsList[noFurtherActionRequiredString] = false;
                } else {
                  actionsTaken.removeWhere((String action) => action == key);
                }
              }
            });
          },
        ),
      );
    });

    return result;
  }
}
