import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_response_state.dart';

void main() {
  group('SurveyResponseState', () {
    test('fromJson', () {
      expect(
        SurveyResponseState.fromJson(<String, dynamic>{}),
        isA<SurveyResponseState>(),
      );
    });
  });
}
