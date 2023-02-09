import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/register_organisation_input_payload.dart';

void main() {
  group('RegisterOrganisationInputPayload', () {
    test('fromJson works', () {
      final RegisterOrganisationInputPayload mockRegisterStaffResponse =
          RegisterOrganisationInputPayload.fromJson(<String, dynamic>{
        'code': 'testCode',
        'name': 'testName',
        'description': 'testDescription',
        'defaultCountry': 'testCountry',
      });

      expect(
        mockRegisterStaffResponse,
        isA<RegisterOrganisationInputPayload>(),
      );
    });
  });
}
