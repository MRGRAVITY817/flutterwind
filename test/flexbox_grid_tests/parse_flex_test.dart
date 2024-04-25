import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_flex.dart';

void main() {
  final sut = parseFlex;

  group("parse flex", () {
    test("flex-1", () {
      final input = ["flex-1"];

      final output = sut(input);

      expect(output['flex'], 1);
    });

    test("flex-2", () {
      final input = ["flex-2"];

      final output = sut(input);

      expect(output['flex'], 2);
    });

    test("multiple flex", () {
      final input = ["flex-1", "flex-2"];

      final output = sut(input);

      expect(output['flex'], null);
    });
  });
}
