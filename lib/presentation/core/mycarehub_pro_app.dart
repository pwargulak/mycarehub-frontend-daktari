// Flutter imports:

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/services/app_setup_data.dart';
import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_model_factories/app_entry_point_view_model_factory.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/pre_load_app.dart';

class MyCareHubProApp extends StatelessWidget {
  const MyCareHubProApp({
    super.key,
    required this.store,
    required this.appSetupData,
    required this.analyticsObserver,
    required this.appName,
  });

  final AppSetupData appSetupData;
  final Store<AppState> store;
  final FirebaseAnalyticsObserver analyticsObserver;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreProviderKey,
      store: store,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
        vm: () => AppEntryPointViewModelFactory(),
        builder: (BuildContext context, AppEntryPointViewModel vm) {
          final String idToken = vm.idToken ?? '';
          final String communitiesAccessToken = vm.communitiesAccessToken ?? '';

          final String graphqlEndpoint =
              appSetupData.customContext!.graphqlEndpoint;

          final String refreshTokenEndpoint =
              appSetupData.customContext?.refreshTokenEndpoint ?? '';

          final String userID = vm.userId ?? '';

          return AppWrapper(
            appContexts: appSetupData.appContexts,
            appName: appName,
            baseContext: appSetupData.customContext,
            graphQLClient: CustomClient(
              idToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            ),
            communitiesClient: CustomClient(
              communitiesAccessToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            ),
            child: PreLoadApp(
              appName: appName,
              appContexts: appSetupData.appContexts,
              analyticsObserver: analyticsObserver,
            ),
          );
        },
      ),
    );
  }
}
