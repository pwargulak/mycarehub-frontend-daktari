// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:healthcloud/domain/core/entities/service_requests/request_count_content.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class ServiceRequestsPage extends StatelessWidget {
  /// [ServiceRequestsPage] is used to display the user information
  ///
  final PendingServiceRequest pendingServiceRequest;

  const ServiceRequestsPage({Key? key, required this.pendingServiceRequest})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int? redFlagCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.RED_FLAG,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    final int? pinResetCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.PIN_RESET,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    final int? profileUpdateCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.PROFILE_UPDATE,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    return Scaffold(
      appBar: const CustomAppBar(title: serviceRequestString),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: SvgPicture.asset(
                  serviceRequestsIconSvg,
                  width: 200,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      if (pinResetCount != null && pinResetCount > 0)
                        ActionCard(
                          counter: pinResetCount.toString(),
                          iconUrl: pinResetImageSvgPath,
                          title: pinResetString,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.pinResetRequestsPage,
                          ),
                        ),
                      if (redFlagCount != null && redFlagCount > 0)
                        ActionCard(
                          counter: redFlagCount.toString(),
                          iconUrl: redFlagStressSvgPath,
                          title: redFlagString,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.redFlagsPage,
                          ),
                        ),
                      if (profileUpdateCount != null && profileUpdateCount > 0)
                        ActionCard(
                          counter: profileUpdateCount.toString(),
                          iconUrl: profileUpdateImageSvgPath,
                          title: profileUpdateString,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.profileUpdateRequestsPage,
                          ),
                        )
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
