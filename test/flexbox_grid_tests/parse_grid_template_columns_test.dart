import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_template_columns.dart';

void main() {
  final sut = parseGridTemplateColumns;

  group("parse grid template columns", () {
    test("parse grid template columns", () {
      final input = ["grid-cols-1"];

      final output = sut(input);

      expect(output, {"grid-cols": 1});
    });
  });
}
