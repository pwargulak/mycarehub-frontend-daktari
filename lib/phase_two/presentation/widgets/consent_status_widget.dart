import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class ConsentStatusWidget extends StatelessWidget {
  const ConsentStatusWidget({
    Key? key,
    this.isConsented = true,
  }) : super(key: key);

  final bool isConsented;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: isConsented
                ? AppColors.malachiteColor
                : AppColors.warningColor,
            shape: BoxShape.circle,
          ),
          child: isConsented
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 18.0,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 18.0,
                ),
        ),
        verySmallHorizontalSizedBox,
        if (isConsented)
          Text(
            clientConsentedString,
            style: normalSize14Text(
              AppColors.malachiteColor,
            ),
          )
        else
          Flexible(
            child: Text(
              clientNotConsentedString,
              style: normalSize14Text(
                AppColors.warningColor,
              ),
            ),
          )
      ],
    );
  }
}
