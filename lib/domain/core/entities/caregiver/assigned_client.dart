import 'package:freezed_annotation/freezed_annotation.dart';

part 'assigned_client.freezed.dart';
part 'assigned_client.g.dart';

@freezed
class AssignedClient with _$AssignedClient {
  factory AssignedClient({
    @JsonKey(name: 'clientID') String? clientID,
  }) = _AssignedClient;

  factory AssignedClient.fromJson(Map<String, dynamic> json) =>
      _$AssignedClientFromJson(json);
}
