import 'package:test/test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_cols_subgrid.dart';

void main() {
  final sut = parseGridColsSubgrid;

  group("parse grid cols subgrid", () {
    test("parse grid cols subgrid", () {
      final input = ["grid-cols-subgrid"];

      final output = sut(input);

      expect(output, {"subgrid": true});
    });
  });
}
