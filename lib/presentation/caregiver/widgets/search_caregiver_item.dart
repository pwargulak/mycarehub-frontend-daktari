import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class SearchCaregiverItem extends StatelessWidget {
  final String name;
  final String caregiverNumber;

  const SearchCaregiverItem({
    super.key,
    required this.name,
    required this.caregiverNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.galleryColor,
                ),
                child: Center(
                  child: Text(
                    name.trim()[0].toUpperCase(),
                    style: boldSize14Text(AppColors.primaryColor),
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: boldSize12Text(),
                  ),
                  Text(
                    'Caregiver number: $caregiverNumber',
                    style: normalSize12Text(AppColors.greyTextColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
