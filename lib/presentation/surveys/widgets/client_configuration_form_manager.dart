import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/client_configuration_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

const String minimumAge = '14';
const String maximumAge = '24';

class ClientConfigurationFormManager with Validator {
  final BehaviorSubject<Map<ClientType, bool>> _clientTypes =
      BehaviorSubject<Map<ClientType, bool>>();
  Stream<Map<ClientType, bool>> get clientTypes => _clientTypes.stream;
  Sink<Map<ClientType, bool>> get inClientTypes => _clientTypes.sink;

  final BehaviorSubject<String> _higherBoundAge = BehaviorSubject<String>();
  Stream<String> get higherBoundAge =>
      _higherBoundAge.stream.transform(validateAgeRange);
  Sink<String> get inHigherBoundAge => _higherBoundAge.sink;

  final BehaviorSubject<String> _lowerBoundAge = BehaviorSubject<String>();
  Stream<String> get lowerBoundAge =>
      _lowerBoundAge.stream.transform(validateAgeRange);
  Sink<String> get inLowerBoundAge => _lowerBoundAge.sink;

  final BehaviorSubject<Map<Gender, bool>> _gender =
      BehaviorSubject<Map<Gender, bool>>();

  Stream<Map<Gender, bool>> get gender => _gender.stream;
  Sink<Map<Gender, bool>> get inGender => _gender.sink;

  Stream<bool> get isFormValid => CombineLatestStream.combine4<
          Map<ClientType, bool>,
          Map<Gender, bool>,
          String,
          String,
          bool>(_clientTypes, _gender, _lowerBoundAge, _higherBoundAge, (
        Map<ClientType, bool> clientTypes,
        Map<Gender, bool> gender,
        String lowerBoundAge,
        String higherBoundAge,
      ) {
        return clientTypes.isNotEmpty &&
            gender.isNotEmpty &&
            clientTypes.containsValue(true) &&
            gender.containsValue(true) &&
            Validator.isValidAgeRange(lowerBoundAge) &&
            Validator.isValidAgeRange(higherBoundAge);
      });

  ClientConfigurationPayload submit() {
    final List<ClientType>? clientTypes = _clientTypes.valueOrNull?.entries
        .where((MapEntry<ClientType, bool> element) => element.value)
        .map((MapEntry<ClientType, bool> entry) => entry.key)
        .toList();

    final List<Gender>? gender = _gender.valueOrNull?.entries
        .where((MapEntry<Gender, bool> element) => element.value)
        .map((MapEntry<Gender, bool> entry) => entry.key)
        .toList();

    return ClientConfigurationPayload(
      clientTypes: clientTypes,
      gender: gender,
    );
  }
}
