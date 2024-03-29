// Flutter imports
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_widget.dart';

class AssessmentListItem extends StatelessWidget {
  const AssessmentListItem({
    required this.assessmentResponse,
    required this.responseStatus,
  });

  final String assessmentResponse;
  final String responseStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                assessmentResponse,
                style: normalSize13Text(AppColors.greyTextColor),
              ),
            ),
            AssessmentWidget(
              title: responseStatus,
            ),
          ],
        ),
        smallVerticalSizedBox,
      ],
    );
  }
}
