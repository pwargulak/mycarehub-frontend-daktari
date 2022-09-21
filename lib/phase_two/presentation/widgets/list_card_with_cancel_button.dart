import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class ListCardWithCancelButton extends StatelessWidget {
  const ListCardWithCancelButton({
    super.key,
    required this.title,
    this.description,
    this.body,
    this.onCancelCallback,
  });

  final String title;
  final String? description;
  final Widget? body;
  final VoidCallback? onCancelCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: veryBoldSize14Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    smallVerticalSizedBox,
                    if (description != null)
                      Text(
                        description!,
                        style: normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onCancelCallback,
                child: Container(
                  width: 40,
                  height: 40,
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
              )
            ],
          ),
          if (body != null) body!,
        ],
      ),
    );
  }
}
