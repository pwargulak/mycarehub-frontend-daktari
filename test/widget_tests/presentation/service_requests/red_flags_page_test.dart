// Package imports:
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/service_requests/pages/red_flags_page.dart';
import 'package:healthcloud/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/platform_loader.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('RedFlagsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagItem = find.byType(RedFlagListItem);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(redFlagItem, findsOneWidget);
    });
    testWidgets('ScheduleMeetDialog renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: RedFlagsPage(),
      );
      await tester.pumpAndSettle();
      final Finder redFlagListItem = find.byType(RedFlagListItem);
      final Finder callButton = find.byKey(dialogCallButtonKey);

      await tester.tap(redFlagListItem.first);
      await tester.pumpAndSettle();

      expect(callButton, findsOneWidget);

      await tester.tap(callButton);
      await tester.pumpAndSettle();
      expect(callButton, findsNothing);
    });
    testWidgets(
      'should show an error widget when fetching a quote',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: RedFlagsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(genericNoDataButtonKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(genericNoDataButtonKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets('should show a loading indicator when fetching red flags',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: RedFlagsPage(),
      );
      await tester.pump();
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
