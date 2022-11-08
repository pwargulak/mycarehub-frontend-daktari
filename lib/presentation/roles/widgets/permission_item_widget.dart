import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class PermissionItemWidget extends StatefulWidget {
  const PermissionItemWidget({
    super.key,
    required this.question,
    required this.index,
    required this.description,
    required this.isAssigned,
  });
  final String question;
  final int index;
  final String description;
  final bool isAssigned;

  @override
  State<PermissionItemWidget> createState() => _PermissionItemWidgetState();
}

class _PermissionItemWidgetState extends State<PermissionItemWidget> {
  bool switchValue = false;
  @override
  void initState() {
    setState(() {
      switchValue = widget.isAssigned;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${widget.index + 1}. ${widget.question}',
              style: veryBoldSize15Text(AppColors.greyTextColor),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 28,
                  width: 50,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(switchValue ? 1 : 0.1),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(
                            switchValue ? 1 : 0.5,
                          ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Switch(
                    key: permissionSwitchKey,
                    value: switchValue,
                    onChanged: (bool? val) {
                      if (val != null) {
                        setState(() {
                          switchValue = val;
                        });
                      }
                    },
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    activeColor: AppColors.whiteColor,
                  ),
                ),
                if (switchValue)
                  const Positioned(
                    top: 5,
                    left: 4,
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),
              ],
            ),
          ],
        ),
        size15VerticalSizedBox,
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Search for all clients on the platform using their phone number, nickname or CCC number',
            style: normalSize14Text(AppColors.greyTextColor),
          ),
        ),
      ],
    );
  }
}
