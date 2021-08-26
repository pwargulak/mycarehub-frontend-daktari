import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/app_theme.dart';
import 'package:shared_ui_components/platform_loader.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({
    required this.store,
    required this.appName,
    required this.appContexts,
  });

  final List<AppContext> appContexts;
  final String appName;
  final Store<CoreState> store;

  @override
  _AuthManagerState createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> with WidgetsBindingObserver {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  BehaviorSubject<String> appInitialRoute = BehaviorSubject<String>();

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      await updateInactivityTime(widget.store);
    } else if (state == AppLifecycleState.resumed) {
      await updateInactivityTime(widget.store);
    }
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Future<dynamic>.delayed(Duration.zero, () async {
        appInitialRoute.add(await getInitialRoute(context: context));
      });
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  Future<void> updateInactivityTime(Store<CoreState> store) async {
    store.dispatch(
      UpdateUserStateAction(
        inActivitySetInTime: DateTime.now().toIso8601String(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: appInitialRoute.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == null) {
          return MaterialApp(
            theme: AppTheme.getAppTheme('flavour'),
            home: const Scaffold(
              body: OnboardingScaffold(
                dimension: 0,
                title: '',
                icon: Icons.security,
                child: Center(child: SILPlatformLoader()),
              ),
            ),
          );
        }

        return MaterialApp(
          theme: bewellProAndroidTheme,
          debugShowCheckedModeBanner: showDebugModeBanner(widget.appContexts),
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            SentryNavigatorObserver(),
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          initialRoute: appInitialRoute.valueOrNull ?? landingPageRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
