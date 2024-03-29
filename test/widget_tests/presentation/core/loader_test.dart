import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlatformLoader', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PlatformLoader()));

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('should display cupertino indicator for IOS',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await tester.pumpWidget(const MaterialApp(home: PlatformLoader()));

      expect(find.byType(PlatformLoader), findsOneWidget);
      expect(find.byKey(const Key('InboxCupertinoThemeKey')), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('should display circular indicator for android',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PlatformLoader()));
      expect(find.byType(PlatformLoader), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
