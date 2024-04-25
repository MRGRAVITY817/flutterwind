import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_letter_spacing.dart';

void main() {
  final sut = parseLetterSpacing;

  group("parse letter spacing", () {
    test("letter spacing", () {
      final input = ["tracking-tighter"];

      final output = sut(input);

      expect(output, {"letter-spacing": -0.05});
    });

    test("multiple letter spacings", () {
      final input = ["tracking-tighter", "tracking-wider"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
