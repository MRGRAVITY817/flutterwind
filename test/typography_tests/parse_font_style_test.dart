import 'package:flutterwind/src/parse_style/typography/parse_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sut = parseFontStyle;

  group('parse font style', () {
    test('parse font style', () {
      final input = ["italic"];

      final output = sut(input);

      expect(output, {"font-style": FontStyle.italic});
    });

    test('parse other font style', () {
      final input = ["not-italic"];

      final output = sut(input);

      expect(output, {"font-style": FontStyle.normal});
    });

    test('parse font style with multiple classes', () {
      final input = ["italic", "not-italic"];

      final output = sut(input);

      expect(output, {});
    });

    test('parse font style with no classes', () {
      final input = ["itali"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
