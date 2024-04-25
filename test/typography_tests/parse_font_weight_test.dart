import 'package:flutterwind/src/parse_style/typography/parse_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sut = parseFontWeight;

  group('parse font weight', () {
    test('parse font weight', () {
      final input = ["font-thin"];

      final output = sut(input);

      expect(output, {"font-weight": FontWeight.w100});
    });

    test('parse other font weight', () {
      final input = ["font-bold"];

      final output = sut(input);

      expect(output, {"font-weight": FontWeight.bold});
    });

    test('parse font weight with multiple classes', () {
      final input = ["font-thin", "font-bold"];

      final output = sut(input);

      expect(output, {});
    });

    test('parse font weight with no classes', () {
      final input = ["font-th"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
