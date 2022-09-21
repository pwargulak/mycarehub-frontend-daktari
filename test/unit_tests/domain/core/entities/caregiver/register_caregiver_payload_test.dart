// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/register_caregiver_payload.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterCaregiverPayload', () {
    test('fromJson works', () {
      final RegisterCaregiverPayload mockRegisterClientResponse =
          RegisterCaregiverPayload.fromJson(mockRegisterCaregiverPayload);
      expect(mockRegisterClientResponse, isA<RegisterCaregiverPayload>());
    });
  });
}
