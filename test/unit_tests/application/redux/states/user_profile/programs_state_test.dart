// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/user_profile/programs_state.dart';

void main() {
  group('ProgramsState', () {
    test('fromJson', () {
      expect(
        ProgramsState.fromJson(<String, dynamic>{}),
        isA<ProgramsState>(),
      );
    });
  });
}
