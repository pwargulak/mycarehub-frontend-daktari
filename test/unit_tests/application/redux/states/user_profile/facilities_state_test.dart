// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/user_profile/facilities_state.dart';

void main() {
  group('FacilitiesState', () {
    test('fromJson', () {
      expect(
        FacilitiesState.fromJson(<String, dynamic>{}),
        isA<FacilitiesState>(),
      );
    });
  });
}
