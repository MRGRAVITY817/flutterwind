import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_flex_direction.dart';

void main() {
  final sut = parseFlexDirection;

  group("parse flex direction", () {
    test("parse flex direction", () {
      final input = ["flex-row"];

      final output = sut(input);

      expect(output, {"flex-direction": Axis.horizontal, "reverse": false});
    });

    test("parse flex direction with reverse", () {
      final input = ["flex-row-reverse"];

      final output = sut(input);

      expect(output, {"flex-direction": Axis.horizontal, "reverse": true});
    });

    test("parse flex direction with column", () {
      final input = ["flex-col"];

      final output = sut(input);

      expect(output, {"flex-direction": Axis.vertical, "reverse": false});
    });

    test("parse flex direction with column reverse", () {
      final input = ["flex-col-reverse"];

      final output = sut(input);

      expect(output, {"flex-direction": Axis.vertical, "reverse": true});
    });

    test("parse flex direction with empty input", () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });

    test("parse flex direction with invalid input", () {
      final input = ["flex-unknown"];

      final output = sut(input);

      expect(output, {});
    });

    test("parse flex direction with multiple valid input", () {
      final input = ["flex-row", "flex-col"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
