import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_thickness.dart';

void main() {
  final sut = parseTextDecorationThickness;

  group("parse text decoration thickness", () {
    test("solid", () {
      final input = ["decoration-1"];

      final output = sut(input);

      expect(output, {"text-decoration-thickness": 1.0});
    });

    test("multiple text decoration thicknesses", () {
      final input = ["decoration-2", "decoration-8"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
