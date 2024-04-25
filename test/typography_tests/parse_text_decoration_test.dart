import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration.dart';

void main() {
  final sut = parseTextDecoration;

  group("parse text decoration", () {
    test("underline", () {
      final input = ["underline"];

      final output = sut(input);

      expect(output, {"text-decoration": TextDecoration.underline});
    });

    test("multiple text decorations", () {
      final input = ["underline", "line-through"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
