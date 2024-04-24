import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';
import 'package:flutterwind/src/parse_style/parse_background_color.dart';

void main() {
  group("parse background color", () {
    final sut = parseBackgroundColor;

    test("parse background color", () {
      final input = ["bg-red-500"];

      final output = sut(input);

      expect(output['bgColor'], Color(0xFFEF4444));
    });

    test("parse background color with invalid color", () {
      final input = ["bg-invalid-500"];

      final output = sut(input);

      expect(output['bgColor'], Color(0x00000000));
    });

    test("parse background color with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output['bgColor'], Color(0x00000000));
    });

    test("parse background color with empty color", () {
      final input = ["bg-"];

      final output = sut(input);

      expect(output['bgColor'], Color(0x00000000));
    });

    test("parse multiple background colors", () {
      final input = ["bg-red-500", "bg-blue-500"];

      final output = sut(input);

      expect(output['bgColor'], Color(0x00000000));
    });

    test("parse background color with opacity", () {
      final input = ["bg-red-500/50"];

      final output = sut(input);

      expect(
        output['bgColor'],
        Color(defaultColorPalette["red-500"]!).withOpacity(0.5),
      );
    });
  });
}
