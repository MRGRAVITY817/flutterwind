import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_justify_items.dart';

void main() {
  final sut = parseJustifyItems;

  group("parse justify items", () {
    test("justify items", () {
      final input = ["justify-items-center"];

      final output = sut(input);

      expect(output, {
        "justify-items": MainAxisAlignment.center,
      });
    });

    test("justify items with multiple values", () {
      final input = ["justify-items-center", "justify-items-end"];

      final output = sut(input);

      expect(output, {});
    });

    test("justify items with invalid value", () {
      final input = ["justify-items-center", "justify-items-abc"];

      final output = sut(input);

      expect(output, {"justify-items": MainAxisAlignment.center});
    });

    test("justify items with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });

    test("justify items with empty value", () {
      final input = ["justify-items-"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
