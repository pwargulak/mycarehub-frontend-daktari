// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/application/redux/states/user_profile_state.dart';

void main() {
  group('UserProfileState', () {
    test('fromJson', () {
      expect(
        UserProfileState.fromJson(<String, dynamic>{}),
        isA<UserProfileState>(),
      );
    });
  });
}
