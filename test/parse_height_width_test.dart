import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_sizing.dart';

void main() {
  group("parse height and width", () {
    final sut = parseHeightWidth;
    final size = Size(300, 400);

    test("parse height and width", () {
      final input = ["h-12", "w-24"];

      final output = sut(input, size);

      expect(output['h'], 48.0);
      expect(output['w'], 96.0);
    });

    test("parse full height", () {
      final input = ["h-full"];

      final output = sut(input, size);

      expect(output['h'], 400.0);
    });

    test("parse full width", () {
      final input = ["w-full"];

      final output = sut(input, size);

      expect(output['w'], 300.0);
    });

    test("fractional height", () {
      final input = ["h-1/2"];

      final output = sut(input, size);

      expect(output['h'], 200.0);
    });

    test("fractional width", () {
      final input = ["w-1/3"];

      final output = sut(input, size);

      expect(output['w'], 99.9999);
    });

    test("parse height and width with empty input", () {
      final input = <String>[];

      final output = sut(input, size);

      expect(output, {'h': null, 'w': null});
    });
  });
}
