import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/user_profile/organisation_state.dart';

void main() {
  group('OrganisationState', () {
    test('fromJson', () {
      expect(
        OrganisationState.fromJson(<String, dynamic>{}),
        isA<OrganisationState>(),
      );
    });
  });
}
