// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

/// [RedFlagListItem] is a shared widget used in [RedFlagsPage]
///
///It takes in two required [clientName] and [feeling] parameters
class RedFlagListItem extends StatelessWidget {
  const RedFlagListItem({this.serviceRequest});

  final ServiceRequest? serviceRequest;

  @override
  Widget build(BuildContext context) {
    final String name = serviceRequest?.clientName ?? '';
    final String phone = serviceRequest?.clientPhoneNumber ?? '';
    final String note = serviceRequest?.meta?.note ?? '';
    final String createdAt = serviceRequest?.createdAt ?? '';

    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: veryBoldSize16Text(AppColors.greyTextColor),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          phone,
                          style: normalSize13Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.redColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      verySadString,
                      style: heavySize12Text(AppColors.redColor),
                    ),
                  ),
                ],
              ),
              size15VerticalSizedBox,
              Text(
                note,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              size15VerticalSizedBox,
              if (createdAt.isNotEmpty)
                Row(
                  children: <Widget>[
                    Text(
                      'Created on ',
                      style: normalSize14Text(
                        AppColors.greyTextColor.withOpacity(0.5),
                      ),
                    ),
                    humanizeDate(
                      dateTextStyle: boldSize14Text(
                        AppColors.greyTextColor.withOpacity(0.5),
                      ),
                      loadedDate: createdAt,
                      showTime: true,
                    )
                  ],
                ),
            ],
          ),
        ),
        size15VerticalSizedBox,
      ],
    );
  }
}
