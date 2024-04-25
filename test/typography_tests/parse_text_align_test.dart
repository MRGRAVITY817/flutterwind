import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_align.dart';

void main() {
  final sut = parseTextAlign;

  group('parse text align', () {
    test('parse text align', () {
      final input = ["text-left"];

      final output = sut(input);

      expect(output, {"text-align": TextAlign.left});
    });

    test('parse other text align', () {
      final input = ["text-center"];

      final output = sut(input);

      expect(output, {"text-align": TextAlign.center});
    });

    test('parse text align with multiple classes', () {
      final input = ["text-left", "text-center"];

      final output = sut(input);

      expect(output, {});
    });

    test('parse text align with no classes', () {
      final input = ["text-lef"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
