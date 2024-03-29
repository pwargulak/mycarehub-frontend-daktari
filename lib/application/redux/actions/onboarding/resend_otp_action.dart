import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ResendOTPAction extends ReduxAction<AppState> {
  ResendOTPAction({required this.context, this.callBackFunction});

  final BuildContext context;
  final VoidCallback? callBackFunction;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(resendOTPFlag));

    ///Ensure the callBackFunction is not null
    callBackFunction?.call();
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(resendOTPFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String? phoneNumber = state.onboardingState?.phoneNumber;

    if (phoneNumber != null && phoneNumber != UNKNOWN) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.pro.name,
      };

      //Incase of send/resend otp error it is cleared
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: false));
      final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.retryResendOtpEndpoint;

      final Response httpResponse = await client.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok == true) {
        // Return OTP sent as string
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final Map<String, dynamic>? data =
            parsed['data'] as Map<String, dynamic>?;

        final String otp = data?['sendRetryOTP'] as String;

        // save the OTP to state
        dispatch(UpdateOnboardingStateAction(otp: otp));
        await AnalyticsService().logEvent(
          name: resendOTPEvent,
          eventType: AnalyticsEventType.ONBOARDING,
        );
        return state;
      } else {
        // exception thrown if the backend could not send an OTP
        feedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? defaultUserFriendlyMessage,
          imageAssetPath: errorIconUrl,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
      }
    } else {
      //Incase user's phone number is not found
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }

    return null;
  }
}
