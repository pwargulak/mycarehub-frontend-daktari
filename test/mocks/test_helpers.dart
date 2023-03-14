// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/app_wrapper/app_wrapper.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_contexts.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_name_constants.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/global_keys.dart';
import 'package:prohealth360_daktari/presentation/router/route_generator.dart';
import 'mocks.dart';

/// [buildTestWidget] is a widget wrapper used for testing
/// It wraps the widget with a `StoreProvider`, `AppWrapperBase`, `MaterialApp` and a `Scaffold`
/// Helps to avoid repetition across test files requiring the above widgets
///
/// The function will create a store for you if you don't provide one
Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget widget,
  Store<AppState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Widget? endDrawer,
  Duration? duration,
}) async {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
    'MATRIX_USERNAME': 'eugene'
  });

  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store ?? Store<AppState>(initialState: AppState.initial()),
      child: AppWrapper(
        appName: testAppName,
        appContexts: testAppContexts,
        baseContext: devAppSetupData.customContext,
        graphQLClient: graphQlClient ?? mockGraphQlClient,
        communitiesClient: graphQlClient ?? mockGraphQlClient,
        child: OverlaySupport(
          child: MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: globalAppNavigatorKey,
            navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
            home: Scaffold(endDrawer: endDrawer, body: widget),
          ),
        ),
      ),
    ),
    duration,
  );
}
