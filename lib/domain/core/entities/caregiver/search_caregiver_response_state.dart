// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';

part 'search_caregiver_response_state.freezed.dart';
part 'search_caregiver_response_state.g.dart';

@freezed
class SearchCaregiverResponseState with _$SearchCaregiverResponseState {
  factory SearchCaregiverResponseState({
    @JsonKey(name: 'searchCaregiverUser') List<Caregiver?>? caregivers,
    bool? errorFetchingCaregivers,
    bool? noCaregiversFound,
    
  }) = _SearchCaregiverResponseState;

  factory SearchCaregiverResponseState.fromJson(Map<String, dynamic> json) =>
      _$SearchCaregiverResponseStateFromJson(json);

  factory SearchCaregiverResponseState.initial() => SearchCaregiverResponseState(
        caregivers: <Caregiver>[],
        errorFetchingCaregivers: false,
        noCaregiversFound: false,
      );
}
