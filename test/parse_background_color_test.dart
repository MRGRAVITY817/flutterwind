import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_background_color.dart';

void main() {
  group("parse background color", () {
    final sut = parseBackgroundColor;

    test("parse background color", () {
      final input = ["bg-red-500"];

      final output = sut(input);

      expect(output['bgColor'], Color(0xFFEF4444));
    });
  });
}
