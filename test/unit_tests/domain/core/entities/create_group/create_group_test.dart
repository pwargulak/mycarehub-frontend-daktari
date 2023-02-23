import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/create_group/create_group_payload.dart';

void main() {
  test(
    'create group',
    () {
      final Map<String, dynamic> createGroupMap =
          CreateGroupPayload(name: 'Test', description: 'desc').toJson();

      final CreateGroupPayload createGroup =
          CreateGroupPayload.fromJson(createGroupMap);

      expect(createGroup.name, 'Test');
    },
  );
}
