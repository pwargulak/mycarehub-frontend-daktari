import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_respondents_state.dart';

void main() {
  group('SurveyResponseState', () {
    test('fromJson', () {
      expect(
        SurveyRespondentsState.fromJson(<String, dynamic>{}),
        isA<SurveyRespondentsState>(),
      );
    });
  });
}
