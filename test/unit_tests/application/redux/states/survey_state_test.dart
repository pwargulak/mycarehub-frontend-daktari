import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';

void main() {
  group('SurveyState', () {
    test('fromJson', () {
      expect(
        SurveyState.fromJson(<String, dynamic>{}),
        isA<SurveyState>(),
      );
    });
  });
}
