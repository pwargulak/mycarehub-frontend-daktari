import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SearchCaregiverItem extends StatelessWidget { 
  final String name;
  final String phoneNumber;
  final VoidCallback? onTapCallback;
  final bool isSelected;

  const SearchCaregiverItem({
    super.key,
    required this.name,
    required this.phoneNumber,
    this.onTapCallback,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Padding(
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
                    if (phoneNumber.isNotEmpty)
                      Text(
                        '$phoneNumberInputLabelText: $phoneNumber',
                        style: normalSize12Text(AppColors.greyTextColor),
                      ),
                  ],
                ),
              ],
            ),
            if (isSelected)
              SvgPicture.asset(doneIconSvgPath)
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}
