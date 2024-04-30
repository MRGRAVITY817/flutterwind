import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:test/test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_auto_flow.dart';

void main() {
  final sut = parseGridAutoFlow;

  group("parse grid auto flow", () {
    test("grid auto flow", () {
      final input = ["grid-flow-col"];

      final output = sut(input);

      expect(output, {
        "grid-auto-flow": AutoPlacement.columnSparse,
      });
    });

    test("grid auto flow row", () {
      final input = ["grid-flow-row"];

      final output = sut(input);

      expect(output, {
        "grid-auto-flow": AutoPlacement.rowSparse,
      });
    });

    test("grid auto flow dense", () {
      final input = ["grid-flow-dense"];

      final output = sut(input);

      expect(output, {
        "grid-auto-flow": AutoPlacement.columnDense,
      });
    });

    test("grid auto flow col dense", () {
      final input = ["grid-flow-col-dense"];

      final output = sut(input);

      expect(output, {
        "grid-auto-flow": AutoPlacement.columnDense,
      });
    });

    test("grid auto flow row dense", () {
      final input = ["grid-flow-row-dense"];

      final output = sut(input);

      expect(output, {
        "grid-auto-flow": AutoPlacement.rowDense,
      });
    });

    test("grid auto flow multiple", () {
      final input = ["grid-flow-col", "grid-flow-dense"];

      final output = sut(input);

      expect(output, {});
    });

    test("grid auto flow none", () {
      final input = ["grid-flow-none"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
