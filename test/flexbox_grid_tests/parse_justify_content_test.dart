import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_justify_content.dart';

void main() {
  final sut = parseJustifyContent;

  group("parse justify content", () {
    test("parse justify content", () {
      final input = ["justify-start"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.start});
    });

    test("parse justify content with end", () {
      final input = ["justify-end"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.end});
    });

    test("parse justify content with center", () {
      final input = ["justify-center"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.center});
    });

    test("parse justify content with between", () {
      final input = ["justify-between"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.spaceBetween});
    });

    test("parse justify content with around", () {
      final input = ["justify-around"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.spaceAround});
    });

    test("parse justify content with evenly", () {
      final input = ["justify-evenly"];

      final output = sut(input);

      expect(output, {"justify-content": MainAxisAlignment.spaceEvenly});
    });

    test("parse justify content with invalid input", () {
      final input = ["justify-unknown"];

      final output = sut(input);

      expect(output, {});
    });

    test("parse justify content with multiple valid input", () {
      final input = ["justify-start", "justify-center"];

      final output = sut(input);

      expect(output, {});
    });

    test("parse justify content with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });
  });
}
