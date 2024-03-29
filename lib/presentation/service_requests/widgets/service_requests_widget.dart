import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class ServiceRequestsWidget extends StatefulWidget {
  const ServiceRequestsWidget({
    this.pendingServiceRequestCount,
    this.errorFetchingServiceRequests,
    required this.isLoading,
    super.key,
  });

  final bool? errorFetchingServiceRequests;
  final bool isLoading;
  final PendingServiceRequestCount? pendingServiceRequestCount;

  @override
  State<ServiceRequestsWidget> createState() => _ServiceRequestsWidgetState();
}

class _ServiceRequestsWidgetState extends State<ServiceRequestsWidget> {
  int _getServiceRequestTypeCount(
    List<ServiceRequestCount>? requests,
    ServiceRequestType type,
  ) {
    return requests
            ?.singleWhere(
              (ServiceRequestCount element) => element.requestType == type,
              orElse: () => ServiceRequestCount.initial(),
            )
            .count ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    final bool error = widget.errorFetchingServiceRequests ?? false;
    if (error) {
      return GenericErrorWidget(
        actionKey: helpNoDataWidgetKey,
        recoverCallback: () {
          StoreProvider.dispatch<AppState>(
            context,
            FetchServiceRequestsCountAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        messageTitle: genericErrorOccurred,
        messageBody: <TextSpan>[
          TextSpan(
            text: getErrorMessage('retrieving the service requests'),
            style: normalSize16Text(
              AppColors.greyTextColor,
            ),
          ),
        ],
      );
    }

    final List<ServiceRequestCount>? clientServiceRequestsCount = widget
        .pendingServiceRequestCount
        ?.clientsServiceRequestCount
        ?.requestsTypeCount;

    final List<ServiceRequestCount>? staffServiceRequestsCount = widget
        .pendingServiceRequestCount
        ?.staffServiceRequestCount
        ?.requestsTypeCount;

    final int redFlagCount = _getServiceRequestTypeCount(
      clientServiceRequestsCount,
      ServiceRequestType.RED_FLAG,
    );
    final int screeningToolsCount = _getServiceRequestTypeCount(
      clientServiceRequestsCount,
      ServiceRequestType.SCREENING_TOOLS_RED_FLAG,
    );

    final int pinResetCount = _getServiceRequestTypeCount(
      clientServiceRequestsCount,
      ServiceRequestType.PIN_RESET,
    );

    final int staffPINResetCount = _getServiceRequestTypeCount(
      staffServiceRequestsCount,
      ServiceRequestType.STAFF_PIN_RESET,
    );

    final int surveysCount = _getServiceRequestTypeCount(
      clientServiceRequestsCount,
      ServiceRequestType.SURVEY_RED_FLAG,
    );

    final int totalCount =
        redFlagCount + pinResetCount + staffPINResetCount + screeningToolsCount;

    return RefreshIndicator(
      onRefresh: () async {
        StoreProvider.dispatch<AppState>(
          context,
          FetchServiceRequestsCountAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
        );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
            if (widget.isLoading) ...<Widget>{
              const Padding(
                padding: EdgeInsets.only(top: 150),
                child: PlatformLoader(),
              )
            } else if (totalCount > 0) ...<Widget>{
              Container(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        // RED FLAGS
                        if (redFlagCount > 0)
                          ActionCard(
                            key: redFlagActionCardKey,
                            count: redFlagCount,
                            iconUrl: redFlagStressSvgPath,
                            title: '${redFlagString}s',
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.redFlagsPage,
                            ),
                          ),
                        // SCREENING TOOLS
                        if (screeningToolsCount > 0)
                          ActionCard(
                            key: screeningToolsActionCardKey,
                            count: screeningToolsCount,
                            iconUrl: screeningToolsImage,
                            title: screeningToolsTitle,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.screeningToolsListPage,
                            ),
                          ),

                        // SURVEY SERVICE REQUESTS
                        if (surveysCount > 0)
                          ActionCard(
                            key: surveysServiceRequestsActionCardKey,
                            count: surveysCount,
                            iconUrl: surveysImagePath,
                            title: surveysString,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.surveyServiceRequestsPage,
                            ),
                          ),

                        // CLIENT PIN RESET REQUESTS
                        if (pinResetCount > 0)
                          ActionCard(
                            key: clientPINResetActionCardKey,
                            count: pinResetCount,
                            iconUrl: pinResetImageSvgPath,
                            title: clientPINResetString,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.pinResetRequestsPage,
                            ),
                          ),

                        // STAFF PIN RESET REQUESTS
                        if (staffPINResetCount > 0)
                          ActionCard(
                            key: staffPINResetActionCardKey,
                            count: staffPINResetCount,
                            iconUrl: pinResetImageSvgPath,
                            title: staffPINResetString,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.staffPinResetRequestsPage,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            } else ...<Widget>{
              GenericErrorWidget(
                actionKey: helpNoDataWidgetKey,
                actionText: actionTextGenericNoData,
                type: GenericNoDataTypes.noData,
                recoverCallback: () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                  }
                },
                messageTitle: getNoDataTile('Service requests'),
                messageBody: <TextSpan>[
                  TextSpan(
                    text: serviceRequestsNoDataBodyString,
                    style: normalSize16Text(AppColors.greyTextColor),
                  ),
                ],
              )
            }
          ],
        ),
      ),
    );
  }
}
