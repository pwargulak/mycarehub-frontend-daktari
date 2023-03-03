import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/update_message_widget.dart';

void main() {
  group('Update Message Widget', () {
    testWidgets('should load correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: UpdateMessageWidget(
                msg: 'This message was deleted',
                icon: Icons.delete,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(UpdateMessageWidget), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });
  });
}
