// Package imports:
import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart' as core;
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/notifications/notification_list_item.dart';
import 'package:prohealth360_daktari/presentation/notifications/notifications_page.dart';
import 'package:prohealth360_daktari/presentation/notifications/widgets/custom_chip_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('NotificationsPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());

      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should render notifications as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: NotificationsPage(),
      );

      await tester.pumpAndSettle();

      final Finder notificationActionItem =
          find.byKey(notificationItemActionKey);
      expect(notificationActionItem, findsOneWidget);

      await tester.tap(notificationActionItem);
      await tester.pumpAndSettle();
      expect(notificationActionItem, findsNothing);

      await tester.tap(find.byKey(appBarBackButtonKey));

      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('should render notification filters as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: NotificationsPage(),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(CustomChipWidget, skipOffstage: false),
        findsNWidgets(4),
      );

      await tester.tap(find.byType(CustomChipWidget).at(3));
      await tester.pumpAndSettle();

      expect(find.byType(NotificationListItem), findsNWidgets(2));
    });
    testWidgets(
        'should render no data generic widget if there are no notifications',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchNotifications': <String, dynamic>{
                'notifications': <dynamic>[]
              }
            },
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: NotificationsPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(core.GenericErrorWidget), findsOneWidget);

      await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();

      expect(find.byType(core.GenericErrorWidget), findsOneWidget);
    });
    testWidgets('should refresh notifications correctly',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: NotificationsPage(),
      );
      final Finder notificationListItem = find.byType(NotificationListItem);
      await tester.pumpAndSettle();

      expect(notificationListItem, findsNWidgets(2));
      await tester.ensureVisible(notificationListItem.last);

      await tester.tap(find.byType(CustomChipWidget).at(3));

      await tester.fling(
        find.byKey(notificationsListViewKey),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      expect(notificationListItem, findsNWidgets(2));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Shows loading indicator when fetching client',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchNotificationsFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: NotificationsPage(),
      );

      expect(find.byType(core.PlatformLoader), findsOneWidget);
    });
  });
}
