import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class ScreeningToolRespondentWidget extends StatelessWidget {
  const ScreeningToolRespondentWidget({
    super.key,
    required this.selectedRespondent,
    required this.toolsType,
  });

  final ScreeningToolRespondent selectedRespondent;
  final ScreeningToolsType toolsType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        StoreProvider.dispatch(
          context,
          UpdateScreeningToolsStateAction(
            selectedRespondent: selectedRespondent,
          ),
        );
        Navigator.pushNamed(
          context,
          AppRoutes.assessmentCardAnswersPage,
          arguments: <String, dynamic>{
            'toolType': toolsType,
            'assessmentResponse': selectedRespondent,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.14),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              selectedRespondent.name ?? '',
              style: veryBoldSize16Text(AppColors.greyTextColor),
            ),
            verySmallVerticalSizedBox,
            size15VerticalSizedBox,
            Text(
              assessmentRequestItemDescriptionString,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
