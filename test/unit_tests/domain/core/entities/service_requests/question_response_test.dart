import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/question_response.dart';
import 'package:sghi_core/communities/models/strings.dart';

void main() {
  test('QuestionResponse initial values are correct', () {
    final QuestionResponse questionResponse = QuestionResponse.initial();
    expect(questionResponse.questionText, UNKNOWN);
    expect(questionResponse.selectMultiple, false);
    expect(questionResponse.sequence, 0);
  });
}
