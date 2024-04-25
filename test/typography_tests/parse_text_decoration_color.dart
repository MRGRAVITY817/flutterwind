import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_color.dart';

void main() {
  final sut = parseTextDecorationColor;

  group("parse text decoration color", () {
    test("sky 400", () {
      final input = ["decoration-sky-400"];

      final output = sut(input);

      expect(
        output,
        {
          "decoration-color": Color(defaultColorPalette["sky-400"]!),
        },
      );
    });

    test("multiple text decoration colors", () {
      final input = ["decoration-sky-400", "decoration-red-500"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
