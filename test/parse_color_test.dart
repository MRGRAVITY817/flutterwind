import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';
import 'package:flutterwind/src/parse_style/parse_color.dart';

void main() {
  group("parse background color", () {
    Map<String, Color> sut(List<String> classes) {
      return parseColor(classes, ["bg"]);
    }

    test("parse background color", () {
      final input = ["bg-red-500"];

      final output = sut(input);

      expect(output['bg-color'], Color(defaultColorPalette["red-500"]!));
    });

    test("parse background color with invalid color", () {
      final input = ["bg-invalid-500"];

      final output = sut(input);

      expect(output['bg-color'], Color(defaultColorPalette["transparent"]!));
    });

    test("parse background color with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output['bg-color'], Color(defaultColorPalette["transparent"]!));
    });

    test("parse background color with empty color", () {
      final input = ["bg-"];

      final output = sut(input);

      expect(output['bg-color'], Color(defaultColorPalette["transparent"]!));
    });

    test("parse multiple background colors", () {
      final input = ["bg-red-500", "bg-blue-500"];

      final output = sut(input);

      expect(output['bg-color'], Color(defaultColorPalette["transparent"]!));
    });

    test("parse background color with opacity", () {
      final input = ["bg-red-500/50"];

      final output = sut(input);

      expect(
        output['bg-color'],
        Color(defaultColorPalette["red-500"]!).withOpacity(0.5),
      );
    });
  });

  group("parse border color", () {
    Map<String, Color> sut(List<String> classes) {
      return parseColor(classes, ["border"]);
    }

    test("parse border color", () {
      final input = ["border-red-500"];

      final output = sut(input);

      expect(output['border-color'], Color(defaultColorPalette["red-500"]!));
    });
  });
}
