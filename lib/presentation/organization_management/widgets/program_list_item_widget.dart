import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class ProgramListItem extends StatelessWidget {
  const ProgramListItem({
    super.key,
    required this.title,
    this.description,
    this.onTap,
    this.subtitle,
    this.onCancel,
    this.isSelected = false,
  });
  final String title;
  final bool isSelected;
  final String? description;
  final String? subtitle;
  final Function()? onCancel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap != null ? () => onTap?.call() : null,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: veryBoldSize17Text(AppColors.primaryColor),
                ),
                if (isSelected)
                  SvgPicture.asset(doneIconSvgPath)
                else if (onCancel != null)
                  GestureDetector(
                    key: cancelButtonKey,
                    onTap: () {
                      onCancel!.call();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.14),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
            size15VerticalSizedBox,
            if (subtitle != null)
              Column(
                children: <Widget>[
                  Text(
                    subtitle!,
                    style: normalSize16Text(
                      AppColors.greyTextColor.withOpacity(0.5),
                    ),
                  ),
                  size15VerticalSizedBox,
                ],
              ),
            if (description != null)
              Text(
                description!,
                overflow: TextOverflow.ellipsis,
                style: normalSize16Text(AppColors.greyTextColor),
              ),
            if (onTap != null)
              Column(
                children: <Widget>[
                  size15VerticalSizedBox,
                  Text(
                    tapToViewMoreInfoString,
                    style: normalSize16Text(
                      AppColors.greyTextColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
