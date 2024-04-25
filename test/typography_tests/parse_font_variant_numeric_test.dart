import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_variant_numeric.dart';

void main() {
  final sut = parseFontVariantNumeric;

  group('parse font variant numeric', () {
    test("normal nums", () {
      final input = ["normal-nums"];

      final output = sut(input);

      expect(output, {"font-features-numeric": []});
    });

    test("ordinal", () {
      final input = ["ordinal"];

      final output = sut(input);

      expect(output, {
        "font-features-numeric": [FontFeature.ordinalForms()]
      });
    });

    test("multiple features", () {
      final input = ["ordinal", "slashed-zero", "lining-nums"];

      final output = sut(input);

      expect(output, {
        "font-features-numeric": [
          FontFeature.ordinalForms(),
          FontFeature.slashedZero(),
          FontFeature.liningFigures(),
        ]
      });
    });
  });
}
