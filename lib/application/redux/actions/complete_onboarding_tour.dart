// Dart imports:
import 'dart:async';

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

/// [CompleteOnboardingTourAction] is a Redux Action whose job is to update a
/// users onboarding tour completion status. Otherwise delightfully notify the
/// user of any Error that might occur during the process
class CompleteOnboardingTourAction extends ReduxAction<AppState> {
  CompleteOnboardingTourAction({
    required this.userID,
    required this.client,
  });

  final String? userID;
  final IGraphQlClient client;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setNickNameFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setNickNameFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'flavour': Flavour.pro.name,
    };

    final http.Response result = await client.query(
      completeOnboardingTourMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final String? errors = client.parseError(body);
    if (errors != null) {
      reportErrorToSentry(
        hint: completeOnboardingTourErrorString,
        query: completeOnboardingTourMutation,
        response: result,
        state: state,
        variables: variables,
      );

      throw UserException(getErrorMessage('completing the onboarding tour'));
    }

    return state;
  }
}
