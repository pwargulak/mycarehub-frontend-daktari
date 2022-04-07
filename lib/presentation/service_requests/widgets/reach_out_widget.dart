// Flutter imports
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/reach_out_channel_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:url_launcher/url_launcher.dart';

class ReachOutWidget extends StatelessWidget {
  const ReachOutWidget({
    required this.phoneNumber,
    required this.clientName,
    required this.staffFirstName,
    required this.staffLastName,
    required this.platform,
  });

  final String phoneNumber;
  final String clientName;
  final String staffFirstName;
  final String staffLastName;
  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          reachOutString,
          style: veryBoldSize20Text(AppColors.greyTextColor),
        ),
        smallVerticalSizedBox,
        Text(
          methodsToReachOutString,
          style: normalSize16Text(AppColors.greyTextColor),
        ),
        smallVerticalSizedBox,
        Row(
          children: <Widget>[
            ReachOutChannelWidget(
              key: redFlagCallActionButtonKey,
              iconSvgUrl: callIconSvgPath,
              description: callString,
              onTapCallback: phoneNumber.isNotEmpty && phoneNumber != UNKNOWN
                  ? () {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: phoneNumber,
                      );
                      launch(launchUri.toString());
                    }
                  : null,
            ),
            smallHorizontalSizedBox,
            ReachOutChannelWidget(
              key: redFlagWhatsappActionButtonKey,
              description: whatsappString,
              iconSvgUrl: whatsappIconSvgPath,
              onTapCallback: phoneNumber.isNotEmpty && phoneNumber != UNKNOWN
                  ? () {
                      String url() {
                        // add the [https]
                        return platform == TargetPlatform.iOS
                            ? 'https://api.whatsapp.com/send?phone=$phoneNumber=${Uri.parse(
                                redFlagSMSTemplate(
                                  clientName: clientName,
                                  staffFirstName: staffFirstName,
                                  staffLastName: staffLastName,
                                ),
                              )}'
                            : 'https://wa.me/$phoneNumber/?text=${Uri.parse(
                                redFlagSMSTemplate(
                                  clientName: clientName,
                                  staffFirstName: staffFirstName,
                                  staffLastName: staffLastName,
                                ),
                              )}';
                      }

                      launch(url());
                    }
                  : null,
            ),
          ],
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}