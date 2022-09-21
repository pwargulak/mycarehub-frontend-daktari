import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/register_caregiver_payload.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class RegisterCaregiverFormManager with Validator {
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Sink<String> get inFirstName => _firstName.sink;

  final BehaviorSubject<String> _lastName = BehaviorSubject<String>();
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Sink<String> get inLastName => _lastName.sink;

  final BehaviorSubject<Gender> _gender = BehaviorSubject<Gender>();
  Stream<Gender> get gender => _gender.stream.transform(validateGender);
  Sink<Gender> get inGender => _gender.sink;

  final BehaviorSubject<DateTime> _dateOfBirth = BehaviorSubject<DateTime>();
  Sink<DateTime> get inDateOfBirth => _dateOfBirth.sink;

  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine5<
          String,
          String,
          Gender,
          DateTime,
          String,
          bool>(_firstName, _lastName, _gender, _dateOfBirth, _phoneNumber, (
        String firstName,
        String lastName,
        Gender gender,
        DateTime dateOfBirth,
        String phoneNumber,
      ) {
        return Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidGender(gender) &&
            Validator.isValidDate(dateOfBirth) &&
            Validator.isValidPhone(phoneNumber);
      });

  RegisterCaregiverPayload submit() {
    final String? firstNameValue = _firstName.valueOrNull;
    final String? lastNameValue = _lastName.valueOrNull;

    return RegisterCaregiverPayload(
      name: '$firstNameValue $lastNameValue',
      gender: _gender.valueOrNull,
      dateOfBirth: _dateOfBirth.valueOrNull,
      phoneNumber: _phoneNumber.valueOrNull,
      sendInvite: true,
    );
  }
}
