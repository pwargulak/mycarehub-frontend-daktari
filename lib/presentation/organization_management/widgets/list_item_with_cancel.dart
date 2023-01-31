import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class ListItemWithCancelButton extends StatelessWidget {
  const ListItemWithCancelButton({
    super.key,
    required this.title,
    this.description,
    this.moreInfo,
    this.onCancelCallback,
  });

  final String title;
  final String? description;
  final String? moreInfo;
  final VoidCallback? onCancelCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
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
                style: veryBoldSize14Text(
                  Theme.of(context).primaryColor,
                ),
              ),
              GestureDetector(
                key: cancelButtonKey,
                onTap: onCancelCallback,
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
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: Text(
                description!,
                style: normalSize15Text(AppColors.greyTextColor),
              ),
            ),
          size15VerticalSizedBox,
          if (moreInfo != null)
            Text(
              moreInfo!,
              style: normalSize14Text(AppColors.greyTextColor.withOpacity(0.5)),
            ),
        ],
      ),
    );
  }
}
