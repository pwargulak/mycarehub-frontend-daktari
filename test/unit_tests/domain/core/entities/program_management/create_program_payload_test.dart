// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/program_management/create_program_payload.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('CreateProgramPayload', () {
    test('fromJson works', () {
      final CreateProgramPayload mockCreateProgramResponse =
          CreateProgramPayload.fromJson(mockCreateProgramPayload);
      expect(mockCreateProgramResponse, isA<CreateProgramPayload>());
    });
  });
}
