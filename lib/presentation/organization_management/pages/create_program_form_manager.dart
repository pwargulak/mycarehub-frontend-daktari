import 'package:prohealth360_daktari/domain/core/entities/program_management/create_program_payload.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class CreateProgramFormManager with Validator {
  final BehaviorSubject<String> _programName = BehaviorSubject<String>();
  Stream<String> get programName => _programName.stream.transform(validateName);
  Sink<String> get inProgramName => _programName.sink;

  final BehaviorSubject<String> _programDescription = BehaviorSubject<String>();
  Stream<String> get programDescription =>
      _programDescription.stream.transform(validateName);
  Sink<String> get inProgramDescription => _programDescription.sink;

  final BehaviorSubject<String> _organisation = BehaviorSubject<String>();
  Sink<String> get inOrganisation => _organisation.sink;

  Stream<bool> get isFormValid =>
      CombineLatestStream.combine3<String, String, String, bool>(
          _programName, _programDescription, _organisation, (
        String programName,
        String programDescription,
        String organisation,
      ) {
        return Validator.isValidName(programName) &&
            Validator.isValidName(programDescription) &&
            Validator.isValidName(organisation);
      });

  CreateProgramPayload submit() {
    return CreateProgramPayload(
      name: _programName.valueOrNull,
      description: _programDescription.valueOrNull,
      organisationID: _organisation.valueOrNull,
    );
  }
}
