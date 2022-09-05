import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class SummaryBadgeWidget extends StatelessWidget {
  const SummaryBadgeWidget({
    required this.title,
    required this.iconUrl,
  });

  final String title;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            iconUrl,
            color: AppColors.primaryColor,
            width: 20,
            height: 20,
          ),
          smallHorizontalSizedBox,
          Text(
            title,
            style: normalSize14Text(
              AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
