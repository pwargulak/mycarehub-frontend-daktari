// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';

void main() {
  group('UserProfile', () {
    test('fromJson', () {
      expect(
        UserProfile.fromJson(<String, dynamic>{}),
        isA<UserProfile>(),
      );
    });
  });
}
