// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';

void main() {
  group('User', () {
    test('fromJson', () {
      expect(
        User.fromJson(<String, dynamic>{}),
        isA<User>(),
      );
    });
  });
}
