import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/phase_two/presentation/register_caregiver/register_caregiver_page.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Register Caregiver Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const RegisterCaregiverPage(),
      );

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      final Finder dobField = find.byKey(dobKey);
      expect(dobField, findsOneWidget);
      expect(find.byKey(patientNumberField), findsOneWidget);
      expect(find.byKey(registerCaregiverButtonKey), findsOneWidget);

      // Dob field
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(addClientsButtonKey));
      await tester.pumpAndSettle();
      
      //Gender field
      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(registerCaregiverButtonKey));
      await tester.pumpAndSettle();
      expect(find.text('Male'), findsOneWidget);
    });
  });
}
