// Flutter imports
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_widget.dart';

class SurveyPreviewResponseItem extends StatelessWidget {
  const SurveyPreviewResponseItem({
    required this.question,
    required this.answers,
    required this.index,
  });

  final String question;
  final List<String> answers;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${index + 1}. $question',
          style: normalSize13Text(AppColors.greyTextColor),
        ),
        smallVerticalSizedBox,
        Wrap(
          runSpacing: 10.0,
          children: List<Widget>.generate(answers.length, (int index) {
            final String answer = answers[index];
            return Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ),
              child: AssessmentWidget(
                title: answer,
              ),
            );
          }),
        ),
        size15VerticalSizedBox,
      ],
    );
  }
}
