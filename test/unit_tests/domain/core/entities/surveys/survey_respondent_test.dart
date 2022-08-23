import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('Survey', () {
    test('expects to convert Survey from json', () {
      expect(SurveyRespondent.initial(), isA<SurveyRespondent>());
      final SurveyRespondent mock =
          SurveyRespondent.fromJson(mockSurveyRespondent);
      expect(mock, isA<SurveyRespondent>());
    });
  });
}
