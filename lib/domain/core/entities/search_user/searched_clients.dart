// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';

part 'searched_clients.freezed.dart';
part 'searched_clients.g.dart';

@freezed
class SearchedClients with _$SearchedClients {
  factory SearchedClients({
    @JsonKey(name: 'searchClientsByCCCNumber')
        List<SearchUserResponse>? clients,
  }) = _SearchedClients;

  factory SearchedClients.fromJson(Map<String, dynamic> json) =>
      _$SearchedClientsFromJson(json);
}