import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class GeneralWorkstationWidget extends StatelessWidget {
  const GeneralWorkstationWidget({
    super.key,
    required this.title,
    required this.bodyWidget,
    this.onButtonCallback,
    required this.buttonText,
  });

  final String title;
  final String buttonText;
  final Widget bodyWidget;
  final VoidCallback? onButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
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
            style: veryBoldSize17Text(AppColors.primaryColor),
          ),
          mediumVerticalSizedBox,
          bodyWidget,
          mediumVerticalSizedBox,
          SizedBox(
            height: 48,
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: Key(buttonText),
              text: buttonText,
              onPressed: onButtonCallback,
            ),
          )
        ],
      ),
    );
  }
}