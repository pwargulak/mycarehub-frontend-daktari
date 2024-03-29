// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users
/// nickname. Otherwise delightfully notify user of any Error that might occur
///  during the process. shouldNavigate is by default set to true unless when
///  the action does not navigate to home page
class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.client,
    this.onSuccess,
    this.onError,
    this.shouldNavigate = true,
  });

  final void Function()? onSuccess;
  final void Function()? onError;
  final IGraphQlClient client;
  final bool shouldNavigate;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setNickNameFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setNickNameFlag));
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.userProfileState?.userProfile?.user?.userId;
    final String? userName =
        state.userProfileState?.userProfile?.user?.username;

    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'nickname': userName,
    };

    final http.Response result = await client.query(
      setNickNameMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? errors = client.parseError(body);

    if (errors != null) {
      onError?.call();

      reportErrorToSentry(
        hint: setNicknameErrorString,
        query: setNickNameMutation,
        response: result,
        state: state,
        variables: variables,
      );

      if (errors.contains('71')) {
        throw const UserException(usernameTakenText);
      } else {
        throw const UserException(somethingWentWrongText);
      }
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['setNickName'] != null && data?['setNickName'] == true) {
      dispatch(
        UpdateOnboardingStateAction(hasSetNickName: true),
      );

      onSuccess?.call();

      final CurrentOnboardingStage? currentOnboardingStage =
          state.onboardingState?.currentOnboardingStage;
      final OnboardingPathInfo path = getOnboardingPath(state: state);

      if (shouldNavigate) {
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.programSelectionPage,
            (Route<dynamic> route) => false,
          ),
        );
        await AnalyticsService().logEvent(
          name: setNicknameEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': path.nextRoute,
            'current_onboarding_workflow':
                describeEnum(currentOnboardingStage!),
          },
        );
      }
    }
    return state;
  }
}
