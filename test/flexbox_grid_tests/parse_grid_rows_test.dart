import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_rows.dart';

void main() {
  final sut = parseGridRows;

  group("parse grid rows", () {
    test("parse grid rows", () {
      final input = ["grid-rows-2"];

      final output = sut(input);

      expect(output, {"grid-rows": 2});
    });
  });
}
