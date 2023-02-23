import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/community/entities/age_range.dart';

void main() {
  test(
    'age range',
    () {
      final Map<String, dynamic> ageRange =
          AgeRange(lowerBound: 1, upperBound: 5).toJson();

      final AgeRange range = AgeRange.fromJson(ageRange);

      expect(range.lowerBound, 1);
      expect(range.upperBound, 5);
    },
  );
}
