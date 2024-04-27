import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_align_items.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  final sut = parseAlignItems;

  group("parse justify items", () {
    test("parse justify items", () {
      final input = ["items-start"];

      final output = sut(input);

      expect(output, {"align-items": CrossAxisAlignment.start});
    });

    test("parse justify items with end", () {
      final input = ["items-end"];

      final output = sut(input);

      expect(output, {"align-items": CrossAxisAlignment.end});
    });

    test("parse justify items with center", () {
      final input = ["items-center"];

      final output = sut(input);

      expect(output, {"align-items": CrossAxisAlignment.center});
    });

    test("parse justify items with stretch", () {
      final input = ["items-stretch"];

      final output = sut(input);

      expect(output, {"align-items": CrossAxisAlignment.stretch});
    });

    test("parse justify items with baseline", () {
      final input = ["items-baseline"];

      final output = sut(input);

      expect(output, {"align-items": CrossAxisAlignment.baseline});
    });

    test("parse justify items with invalid input", () {
      final input = ["items-unknown"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
