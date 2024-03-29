import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart' as afya_moja_core;
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:rxdart/src/streams/merge.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/application/core/services/localization.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/set_push_token/set_push_token_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/user_state_actions/check_token_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/initial_route_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/global_keys.dart';
import 'package:prohealth360_daktari/infrastructure/connectivity/connectivity_interface.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/error_dialog.dart';
import 'package:prohealth360_daktari/presentation/router/route_generator.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class PreLoadApp extends StatefulWidget {
  const PreLoadApp({
    required this.appName,
    required this.appContexts,
    required this.analyticsObserver,
  });

  final FirebaseAnalyticsObserver analyticsObserver;
  final List<AppContext> appContexts;
  final String appName;

  @override
  State<PreLoadApp> createState() => _PreLoadAppState();
}

class _PreLoadAppState extends State<PreLoadApp> with WidgetsBindingObserver {
  final ConnectivityChecker connectivityChecker = ConnectivityChecker.initial();
  StreamSubscription<bool>? connectivityCheckerSubscription;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final AppState? appState = StoreProvider.state<AppState>(context);
    final bool resumeWithPin = appState?.miscState?.resumeWithPin ?? false;
    if (state == AppLifecycleState.inactive && !resumeWithPin) {
      StoreProvider.dispatch<AppState>(
        context,
        BatchUpdateMiscStateAction(inactiveTime: DateTime.now().toString()),
      );
    }

    if (state == AppLifecycleState.resumed &&
        resumeWithPIN(appState ?? AppState.initial())) {
      StoreProvider.dispatch<AppState>(
        context,
        BatchUpdateMiscStateAction(resumeWithPin: true),
      );
      Navigator.pushReplacementNamed(
        globalAppNavigatorKey.currentContext!,
        AppRoutes.resumeWithPin,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    StoreProvider.dispatch(
      context,
      CheckTokenAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        refreshTokenEndpoint:
            AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
      ),
    );

    StoreProvider.dispatch(
      context,
      SetPushToken(
        firebaseMessaging: _firebaseMessaging,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    initializeFCMListener();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivityCheckerSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      onDispose: (Store<AppState> store) {},
      builder: (BuildContext context, InitialRouteViewModel vm) {
        String initialRoute = vm.initialRoute ?? AppRoutes.loginPage;

        final bool isPhoneLogin =
            initialRoute.compareTo(AppRoutes.loginPage) == 0;
        final bool isResumeWithPin =
            initialRoute.compareTo(AppRoutes.resumeWithPin) == 0;
        if (!isPhoneLogin && !isResumeWithPin) {
          initialRoute = AppRoutes.homePage;
        }

        if ((initialRoute == AppRoutes.homePage ||
                initialRoute == AppRoutes.programSelectionPage) &&
            (vm.defaultFacility?.id == null ||
                vm.defaultFacility?.id == afya_moja_core.UNKNOWN)) {
          initialRoute = AppRoutes.facilitySelectionPage;
        }

        if ((initialRoute == AppRoutes.homePage ||
                initialRoute == AppRoutes.facilitySelectionPage) &&
            (vm.selectedProgram?.id == null ||
                vm.selectedProgram?.id == afya_moja_core.UNKNOWN)) {
          initialRoute = AppRoutes.programSelectionPage;
        }

        return OverlaySupport(
          child: MaterialApp(
            builder: (BuildContext context, Widget? childWidget) {
              connectivityCheckerSubscription = connectivityChecker
                  .checkConnection()
                  .asStream()
                  .mergeWith(
                    <Stream<bool>>[connectivityChecker.onConnectivityChanged],
                  )
                  .distinct()
                  .listen((bool hasConnection) {
                    final bool hasConn = StoreProvider.state<AppState>(context)
                            ?.connectivityState
                            ?.isConnected ??
                        false;

                    if (!hasConnection && hasConn) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(connectionLostText)),
                      );
                    }
                    StoreProvider.dispatch(
                      context,
                      UpdateConnectivityAction(hasConnection: hasConnection),
                    );
                  });

              return UserExceptionDialog<AppState>(
                onShowUserExceptionDialog: (
                  BuildContext context,
                  UserException userException,
                  bool useLocalContext,
                ) {
                  showDialog(
                    context: globalAppNavigatorKey.currentContext!,
                    builder: (BuildContext context) {
                      String? subtitle;

                      if (userException.cause != null &&
                          userException.cause?.runtimeType == String) {
                        subtitle = userException.cause! as String;
                      }

                      return ErrorDialog(
                        title: userException.msg ?? defaultUserFriendlyMessage,
                        subTitle: subtitle,
                        buttonAction: () =>
                            globalAppNavigatorKey.currentState?.pop(),
                      );
                    },
                  );
                },
                child: childWidget!,
              );
            },
            theme: AppTheme.getAppTheme(),
            debugShowCheckedModeBanner: false,
            navigatorKey: globalAppNavigatorKey,
            navigatorObservers: <NavigatorObserver>[
              widget.analyticsObserver,
              SentryNavigatorObserver(),
            ],
            initialRoute: initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
            localizationsDelegates: localizationDelegates,
            supportedLocales: locales,
          ),
        );
      },
    );
  }

  void initializeFCMListener() {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    ); //for logo
    const DarwinInitializationSettings darwinInit =
        DarwinInitializationSettings();
    const InitializationSettings initSetting = InitializationSettings(
      android: androidInit,
      iOS: darwinInit,
    );
    flutterLocalNotificationsPlugin.initialize(initSetting);
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      '1',
      'channelName',
      channelDescription: 'channel Description',
    );
    const DarwinNotificationDetails darwinDetails = DarwinNotificationDetails();

    const NotificationDetails generalNotificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      final AppleNotification? apple = message.notification?.apple;
      if (notification != null && (android != null || apple != null)) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          generalNotificationDetails,
        );
        afya_moja_core.headsUpNotification(
          notification.title,
          notification.body,
        );
      }
    });
  }
}
