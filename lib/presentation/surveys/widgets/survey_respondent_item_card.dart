import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SurveyRespondentItemCard extends StatelessWidget {
  const SurveyRespondentItemCard({
    super.key,
    required this.title,
    this.onTapCallback,
  });

  final String title;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.14),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: veryBoldSize17Text(
                AppColors.lightBlackTextColor,
              ),
            ),
            smallVerticalSizedBox,
            Text(
              tapToViewTheirResponse,
              style: normalSize14Text(AppColors.grey50),
            )
          ],
        ),
      ),
    );
  }
}
