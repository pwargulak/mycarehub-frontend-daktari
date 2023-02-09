import 'package:prohealth360_daktari/domain/core/entities/organisations/register_organisation_input_payload.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class CreateOrganizationFormManager with Validator {
  final BehaviorSubject<String> _registrationNumber = BehaviorSubject<String>();
  Stream<String> get registrationNumber =>
      _registrationNumber.stream.transform(validateName);
  Sink<String> get inRegistrationNumber => _registrationNumber.sink;

  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  final BehaviorSubject<String> _name = BehaviorSubject<String>();
  Stream<String> get name => _name.stream.transform(validateName);
  Sink<String> get inName => _name.sink;

  final BehaviorSubject<String> _description = BehaviorSubject<String>();
  Stream<String> get description => _description.stream.transform(validateName);
  Sink<String> get inDescription => _description.sink;

  final BehaviorSubject<String> _country = BehaviorSubject<String>();
  Stream<String> get country => _country.stream.transform(validateName);
  Sink<String> get inCountry => _country.sink;

  final BehaviorSubject<String> _emailAddress = BehaviorSubject<String>();
  Stream<String> get emailAddress =>
      _emailAddress.stream.transform(validateEmail);
  Sink<String> get inEmailAddress => _emailAddress.sink;

  final BehaviorSubject<String> _physicalAddress = BehaviorSubject<String>();
  Stream<String> get physicalAddress =>
      _physicalAddress.stream.transform(validateName);
  Sink<String> get inPhysicalAddress => _physicalAddress.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine7<String, String,
              String, String, String, String, String, bool>(
          _registrationNumber,
          _phoneNumber,
          _name,
          _description,
          _country,
          _emailAddress,
          _physicalAddress, (
        String registrationNumber,
        String phoneNumber,
        String name,
        String description,
        String country,
        String emailAddress,
        String physicalAddress,
      ) {
        return Validator.isValidName(registrationNumber) &&
            Validator.isValidName(name) &&
            Validator.isValidName(description) &&
            Validator.isValidName(country) &&
            Validator.isValidOptionalEmail(emailAddress) &&
            Validator.isValidPhone(phoneNumber);
      });

  RegisterOrganisationInputPayload submit() {
    return RegisterOrganisationInputPayload(
      registrationNumber: _registrationNumber.valueOrNull,
      name: _name.valueOrNull,
      description: _description.valueOrNull,
      country: _country.valueOrNull,
      phoneNumber: _phoneNumber.valueOrNull,
      emailAddress: _emailAddress.valueOrNull,
      physicalAddress: _physicalAddress.valueOrNull,
      postalAddress: '',
    );
  }
}
