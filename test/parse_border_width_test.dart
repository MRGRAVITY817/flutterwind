import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_border_width.dart';

void main() {
  group("parse border width", () {
    final sut = parseBorderWidth;

    test("every side", () {
      final input = ["border-4"];

      final output = sut(input);

      expect(
        output,
        {
          'border-top-width': 4.0,
          'border-right-width': 4.0,
          'border-bottom-width': 4.0,
          'border-left-width': 4.0,
        },
      );
    });

    test("each side", () {
      final input = [
        "border-t",
        "border-r-0",
        "border-b-2",
        "border-l-4",
      ];

      final output = sut(input);

      expect(
        output,
        {
          'border-top-width': 1.0,
          'border-right-width': 0.0,
          'border-bottom-width': 2.0,
          'border-left-width': 4.0,
        },
      );
    });

    test("override with more detailed config", () {
      final input = [
        "border",
        "border-t-2",
        "border-l-4",
      ];

      final output = sut(input);

      expect(
        output,
        {
          'border-top-width': 2.0,
          'border-right-width': 1.0,
          'border-bottom-width': 1.0,
          'border-left-width': 4.0,
        },
      );
    });
  });
}
