import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/utils/parse_position_value.dart';

void main() {
  final sut = separatePrefix;

  group("separate prefix", () {
    test("px-4", () {
      final className = "px-4";
      final prefix = "p";

      final output = sut(
        className: className,
        prefix: prefix,
      );

      expect(output, "p-x-4");
    });
  });
}
