import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final size = Size(300, 400);
  sut(style) => parseStyle(style, size);

  group("typography collision test", () {
    test("parse font size and color", () {
      final input = "text-white text-xl";

      final output = sut(input);

      expect(output["text-color"], Colors.white);
      expect(output["font-size"], 20.0);
      expect(output["line-height"], 28.0);
    });
  });
}
