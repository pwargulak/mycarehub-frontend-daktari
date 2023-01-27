import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class ProgramListItem extends StatelessWidget {
  const ProgramListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });
  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
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
            smallVerticalSizedBox,
            Text(
              subtitle,
              style: normalSize16Text(AppColors.greyTextColor.withOpacity(0.5)),
            ),
            size15VerticalSizedBox,
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: normalSize16Text(AppColors.greyTextColor),
            ),
            size15VerticalSizedBox,
            Text(
              tapToViewMoreInfoString,
              style: normalSize16Text(AppColors.greyTextColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
