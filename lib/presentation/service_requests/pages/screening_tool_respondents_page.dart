import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_assessment_respondents_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_available_facility_screening_tools_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/screening_tool_respondent_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ScreeningToolRespondentsPage extends StatefulWidget {
  const ScreeningToolRespondentsPage({
    super.key,
    required this.screeningTool,
  });

  final ScreeningTool screeningTool;

  @override
  State<ScreeningToolRespondentsPage> createState() =>
      _ScreeningToolRespondentsPageState();
}

class _ScreeningToolRespondentsPageState
    extends State<ScreeningToolRespondentsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchScreeningToolsRespondentsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          screeningToolID: widget.screeningTool.id ?? '',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreeningToolsType toolType =
        getScreeningToolType(widget.screeningTool.questionnaire?.name ?? '');
    return Scaffold(
      appBar: CustomAppBar(
        title: getAssessmentScorePageTitle(
          screeningToolsType: toolType,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StoreConnector<AppState, ServiceRequestsViewModel>(
          converter: (Store<AppState> store) =>
              ServiceRequestsViewModel.fromStore(store),
          builder: (BuildContext context, ServiceRequestsViewModel vm) {
            final bool error = vm.errorFetchingServiceRequests ?? false;
            final List<ScreeningToolRespondent>? responses =
                vm.screeningToolsState!.screeningToolRespondents;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (!error) ...<Widget>{
                    smallVerticalSizedBox,
                    SvgPicture.asset(screeningToolsImage, height: 150),
                    smallVerticalSizedBox,
                    if (responses?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          assessmentToolsResponsesPageDescription,
                          style: normalSize14Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    if (vm.wait.isWaitingFor(
                      fetchAssessmentResponsesByToolFlag,
                    )) ...<Widget>{
                      const Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: PlatformLoader(),
                      )
                    } else if (responses?.isNotEmpty ?? false)
                      ...List<Widget>.generate(responses!.length, (int index) {
                        return ScreeningToolRespondentWidget(
                          selectedRespondent: responses[index],
                          toolsType: toolType,
                        );
                      })
                    else
                      GenericErrorWidget(
                        type: GenericNoDataTypes.noData,
                        actionKey: helpNoDataWidgetKey,
                        actionText: thanksText,
                        recoverCallback: () {
                          StoreProvider.dispatch<AppState>(
                            context,
                            FetchAvailableFacilityScreeningToolsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                            ),
                          );
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        messageTitle: getNoDataTile(
                          getAssessmentScorePageTitle(
                            screeningToolsType: toolType,
                          ).toLowerCase(),
                        ),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getAssessmentScoreNoDatBodyText(
                              screeningToolsType: toolType,
                            ),
                            style: normalSize16Text(AppColors.greyTextColor),
                          ),
                        ],
                      )
                  } else ...<Widget>{
                    GenericErrorWidget(
                      messageTitle: genericErrorOccurred,
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchScreeningToolsRespondentsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            screeningToolID: widget.screeningTool.id ?? '',
                          ),
                        );
                      },
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(
                            fetchingAssessmentResponsesString,
                          ),
                          style: normalSize16Text(AppColors.greyTextColor),
                        ),
                      ],
                    )
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
