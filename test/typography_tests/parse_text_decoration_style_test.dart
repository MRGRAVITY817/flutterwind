import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_style.dart';

void main() {
  final sut = parseTextDecorationStyle;

  group("parse text decoration style", () {
    test("solid", () {
      final input = ["decoration-solid"];

      final output = sut(input);

      expect(output, {"text-decoration-style": TextDecorationStyle.solid});
    });

    test("multiple text decoration styles", () {
      final input = ["decoration-solid", "decoration-double"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
