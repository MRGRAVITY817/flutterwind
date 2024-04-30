import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_row_start_end.dart';

void main() {
  final sut = parseGridRowStartEnd;

  group("parse grid row start end", () {
    test("grid row start end", () {
      final input = ["row-start-1", "row-end-3"];

      final output = sut(input);

      expect(output, {
        "grid-row-start": 1,
        "grid-row-span": 2,
      });
    });

    test("only grid row start", () {
      final input = ["row-start-1"];

      final output = sut(input);

      expect(output, {
        "grid-row-start": 1,
        "grid-row-span": 1,
      });
    });

    test("grid row span", () {
      final input = ["row-span-3"];

      final output = sut(input);

      expect(output, {
        "grid-row-span": 3,
      });
    });

    test("grid row start with span", () {
      final input = ["row-start-2", "row-span-2"];

      final output = sut(input);

      expect(output, {
        "grid-row-start": 2,
        "grid-row-span": 2,
      });
    });

    test("grid row end with span", () {
      final input = ["row-end-4", "row-span-2"];

      final output = sut(input);

      expect(output, {
        "grid-row-start": 2,
        "grid-row-span": 2,
      });
    });

    test("grid row span is larger than row end", () {
      final input = ["row-end-3", "row-span-3"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
