import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class RoleListItemWidget extends StatelessWidget {
  const RoleListItemWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

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
          size15VerticalSizedBox,
          Text(
            description,
            style: normalSize16Text(AppColors.greyTextColor),
          ),
          size15VerticalSizedBox,
          Text(
            tapToViewMoreInfoString,
            style: normalSize16Text(AppColors.greyTextColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
