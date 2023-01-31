// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import '../../../mocks/mocks.dart';

void main() {
  test('Facility fromJson', () {
    expect(
      Facility.fromJson(mockFacility),
      isA<Facility>(),
    );
    expect(Facility.initial(), isA<Facility>());
  });
}
