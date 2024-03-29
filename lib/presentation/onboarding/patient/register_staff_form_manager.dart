import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_staff/register_staff_payload.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class RegisterStaffFormManager with Validator {
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Sink<String> get inFirstName => _firstName.sink;

  final BehaviorSubject<String> _lastName = BehaviorSubject<String>();
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Sink<String> get inLastName => _lastName.sink;

  final BehaviorSubject<String> _facility = BehaviorSubject<String>();
  Sink<String> get inFacility => _facility.sink;

  final BehaviorSubject<DateTime> _dateOfBirth = BehaviorSubject<DateTime>();
  Sink<DateTime> get inDateOfBirth => _dateOfBirth.sink;

  final BehaviorSubject<Gender> _gender = BehaviorSubject<Gender>();
  Stream<Gender> get gender => _gender.stream.transform(validateGender);
  Sink<Gender> get inGender => _gender.sink;

  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  final BehaviorSubject<String> _idNumber = BehaviorSubject<String>();
  Stream<String> get idNumber => _idNumber.stream.transform(validateName);
  Sink<String> get inIdNumber => _idNumber.sink;

  final BehaviorSubject<String> _staffNumber = BehaviorSubject<String>();
  Stream<String> get staffNumber => _staffNumber.stream.transform(validateName);
  Sink<String> get inStaffNumber => _staffNumber.sink;

  final BehaviorSubject<bool> _inviteStaff = BehaviorSubject<bool>();
  Stream<bool> get inviteClient => _inviteStaff.stream;
  Sink<bool> get inInviteClient => _inviteStaff.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine8<String, String,
              String, DateTime, Gender, String, String, String, bool>(
          _firstName,
          _lastName,
          _facility,
          _dateOfBirth,
          _gender,
          _phoneNumber,
          _idNumber,
          _staffNumber, (
        String firstName,
        String lastName,
        String facility,
        DateTime dateOfBirth,
        Gender gender,
        String phoneNumber,
        String idNumber,
        String staffNumber,
      ) {
        return Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidName(facility) &&
            Validator.isValidDate(dateOfBirth) &&
            Validator.isValidGender(gender) &&
            Validator.isValidPhone(phoneNumber) &&
            Validator.isValidName(idNumber) &&
            Validator.isValidName(staffNumber);
      });

  RegisterStaffPayload submit() {
    final String? firstNameValue = _firstName.valueOrNull;
    final String? lastNameValue = _lastName.valueOrNull;
    final bool? inviteStaff = _inviteStaff.valueOrNull;

    return RegisterStaffPayload(
      staffName: '$firstNameValue $lastNameValue',
      facility: _facility.valueOrNull,
      dateOfBirth: _dateOfBirth.valueOrNull,
      gender: _gender.valueOrNull,
      phoneNumber: _phoneNumber.valueOrNull,
      idNumber: _idNumber.valueOrNull,
      staffNumber: _staffNumber.valueOrNull,
      role: RoleValue.CLIENT_MANAGEMENT,
      inviteStaff: inviteStaff ?? false,
    );
  }
}
