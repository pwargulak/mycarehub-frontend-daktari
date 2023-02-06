import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';

class OrganisationListItem extends StatelessWidget {
  const OrganisationListItem({
    required this.organisation,
    required this.onClicked,
    this.isSelected = false,
  });

  final Organisation organisation;
  final VoidCallback onClicked;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.35),
                  ),
                  child: Center(
                    child: Text(
                      organisation.name!.trim()[0].toUpperCase(),
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                smallHorizontalSizedBox,
                Text(
                  organisation.name ?? '',
                  style: boldSize14Text().copyWith(),
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
