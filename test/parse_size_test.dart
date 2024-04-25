import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_sizing.dart';

void main() {
  group("parse size", () {
    final sut = parseSize;

    test("parse size", () {
      final input = ["size-12"];

      final output = sut(input);

      expect(output['h'], 48.0);
      expect(output['w'], 48.0);
    });

    test("size is not a number", () {
      final input = ["size-abc"];

      final output = sut(input);

      expect(output, {'h': null, 'w': null});
    });

    test("size with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {'h': null, 'w': null});
    });

    test("size with empty size", () {
      final input = ["size-"];

      final output = sut(input);

      expect(output, {'h': null, 'w': null});
    });

    test("parse multiple sizes", () {
      final input = ["size-12", "size-24"];

      final output = sut(input);

      expect(output, {'h': 0.0, 'w': 0.0});
    });
  });
}
