import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_align_self.dart';

void main() {
  final sut = parseAlignSelf;

  group("parse align self", () {
    test("parse align self", () {
      final input = ["self-start"];

      final output = sut(input);

      expect(output, {"align-self": CrossAxisAlignment.start});
    });

    test("parse align self with end", () {
      final input = ["self-end"];

      final output = sut(input);

      expect(output, {"align-self": CrossAxisAlignment.end});
    });

    test("parse align self with center", () {
      final input = ["self-center"];

      final output = sut(input);

      expect(output, {"align-self": CrossAxisAlignment.center});
    });

    test("parse align self with stretch", () {
      final input = ["self-stretch"];

      final output = sut(input);

      expect(output, {"align-self": CrossAxisAlignment.stretch});
    });

    test("parse align self with baseline", () {
      final input = ["self-baseline"];

      final output = sut(input);

      expect(output, {"align-self": CrossAxisAlignment.baseline});
    });

    test("parse align self with invalid input", () {
      final input = ["self-unknown"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
