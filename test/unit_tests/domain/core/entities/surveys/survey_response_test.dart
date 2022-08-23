import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('Survey', () {
    test('expects to convert Survey from json', () {
      expect(SurveyResponse.initial(), isA<SurveyResponse>());
      final SurveyResponse mock =
          SurveyResponse.fromJson(mockSurveyResponse);
      expect(mock, isA<SurveyResponse>());
      expect(mock.answers!.first, 'testA');
    });
  });
}
