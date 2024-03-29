import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class VerifyOTPAction extends ReduxAction<AppState> {
  VerifyOTPAction({
    required this.context,
    required this.otp,
  });

  final BuildContext context;
  final String otp;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyOTPFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(verifyOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber = state.onboardingState!.phoneNumber ?? UNKNOWN;

    if (phoneNumber != UNKNOWN) {
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.verifyContactOTPEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'otp': otp,
        'phoneNumber': phoneNumber,
        'flavour': Flavour.pro.name,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok) {
        final Map<String, dynamic> jsonData =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;
        final Map<String, dynamic>? data =
            jsonData['data'] as Map<String, dynamic>?;

        final bool isValid = data?['verifyOTP'] as bool;

        if (isValid) {
          dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: isValid,
            ),
          );

          final OnboardingPathInfo onboardingPathConfig =
              getOnboardingPath(state: state);
          final CurrentOnboardingStage? currentOnboardingStage =
              state.onboardingState?.currentOnboardingStage;

          dispatch(
            NavigateAction<AppState>.pushNamed(onboardingPathConfig.nextRoute),
          );
          await AnalyticsService().logEvent(
            name: verifyOTPEvent,
            eventType: AnalyticsEventType.ONBOARDING,
            parameters: <String, dynamic>{
              'next_page': onboardingPathConfig.nextRoute,
              'current_onboarding_workflow':
                  describeEnum(currentOnboardingStage!),
            },
          );
          return state;
        } else {
          throw MyAfyaException(
            cause: 'verify_otp_error',
            message: invalidCode,
          );
        }
      } else {
        throw MyAfyaException(
          error: processedResponse.response,
          cause: 'verify_otp_error',
          message: processedResponse.message,
        );
      }
    }

    return null;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      feedbackBottomSheet(
        context: context,
        modalContent: (error as MyAfyaException).message.toString(),
        imageAssetPath: errorIconUrl,
      );
    }
    return error;
  }
}
