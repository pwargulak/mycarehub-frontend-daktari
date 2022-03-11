// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/entities/core/contact.dart';
import '../../../mocks/mocks.dart';

void main() {
  test('Contact fromJson', () {
    expect(
      Contact.fromJson(mockPrimaryContact),
      isA<Contact>(),
    );
    expect(Contact.initial(), isA<Contact>());
  });
}
