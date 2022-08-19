import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SurveysCard extends StatelessWidget {
  const SurveysCard({
    required this.title,
    this.message,
    this.isLoading = false,
    this.primaryButtonKey,
    this.primaryButtonText = sendOutString,
    this.onTapCard,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.secondaryButtonKey,
    this.secondaryButtonText,
  });

  final void Function()? onPrimaryButtonPressed;
  final void Function()? onSecondaryButtonPressed;
  final bool isLoading;
  final String? message;
  final VoidCallback? onTapCard;
  final Key? primaryButtonKey;
  final String? primaryButtonText;
  final Key? secondaryButtonKey;
  final String? secondaryButtonText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF0EAF4),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: veryBoldSize16Text(AppColors.lightBlackTextColor),
                ),
                mediumVerticalSizedBox,
                if (message != null)
                  Column(
                    children: <Widget>[
                      Text(
                        message!,
                        style: normalSize14Text(darkGreyTextColor),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                else
                  mediumVerticalSizedBox,
                if (primaryButtonKey != null)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: isLoading
                        ? const PlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonKey: primaryButtonKey,
                            text: primaryButtonText,
                            onPressed: onPrimaryButtonPressed,
                          ),
                  ),
                mediumVerticalSizedBox,
                if (secondaryButtonKey != null)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: isLoading
                        ? const PlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonColor:
                                AppColors.primaryColor.withOpacity(0.14),
                            textColor: AppColors.primaryColor,
                            borderColor: Colors.transparent,
                            buttonKey: secondaryButtonKey,
                            text: secondaryButtonText,
                            onPressed: onSecondaryButtonPressed,
                          ),
                  )
              ],
            ),
          ),
          mediumVerticalSizedBox,
        ],
      ),
    );
  }
}
