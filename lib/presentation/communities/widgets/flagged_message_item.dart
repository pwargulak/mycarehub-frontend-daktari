import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/event_report.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/avatar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/communities/models/strings.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class FlaggedReportListItem extends StatelessWidget {
  const FlaggedReportListItem({required this.report, this.optionKey});

  final EventReport report;

  final Key? optionKey;

  @override
  Widget build(BuildContext context) {
    final String sender = report.sender ?? noUserID;
    final String reporter = report.userID ?? noUserID;

    final String formattedSender = formatUsername(sender);
    final String formattedReporter = formatUsername(reporter);

    final String timeStamp = formatTimestamp(report.reportDate);

    return InkWell(
      key: optionKey,
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.purple.withOpacity(0.3),
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.flaggedMessagePreviewRoute,
          arguments: report,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar(
              avatarURI: UNKNOWN,
              displayName: formattedSender.split('@').last,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  smallHorizontalSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        formattedSender,
                        style: TextStyle(
                          color: Colors.purple.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      // TODO!!(abiud): Fix text overflows here
                      Text(
                        reportedByString(formattedReporter, timeStamp),
                        style: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
