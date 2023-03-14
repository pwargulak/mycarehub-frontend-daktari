// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/assigned_caregiver.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('AssignCaregiver', () {
    test('fromJson works', () {
      final AssignedCaregiver mockAssignedCaregiverResponse =
          AssignedCaregiver.fromJson(mockAssignCaregiver);
      expect(mockAssignedCaregiverResponse, isA<AssignedCaregiver>());
    });
  });
}
