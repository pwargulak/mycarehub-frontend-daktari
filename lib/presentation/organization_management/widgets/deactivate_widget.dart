import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class DeactivateWidget extends StatelessWidget {
  const DeactivateWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onPressedCallback,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.warningColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.warningColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: veryBoldSize16Text(AppColors.warningColor),
          ),
          size15VerticalSizedBox,
          Text(
            description,
            style: normalSize15Text(AppColors.greyTextColor),
          ),
          size15VerticalSizedBox,
          SizedBox(
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: deleteButtonKey,
              buttonColor: AppColors.warningColor,
              text: buttonText,
              onPressed: onPressedCallback,
            ),
          ),
        ],
      ),
    );
  }
}
