import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_column_start_end.dart';

void main() {
  final sut = parseGridColumnStartEnd;

  test("grid column start end", () {
    final input = ["col-start-1", "col-end-3"];

    final output = sut(input);

    expect(output, {
      "grid-column-start": 1,
      "grid-column-span": 2,
    });
  });

  test("only grid column start", () {
    final input = ["col-start-1"];

    final output = sut(input);

    expect(output, {
      "grid-column-start": 1,
      "grid-column-span": 1,
    });
  });

  test("grid column span", () {
    final input = ["col-span-3"];

    final output = sut(input);

    expect(output, {
      "grid-column-span": 3,
    });
  });

  test("grid column start with span", () {
    final input = ["col-start-2", "col-span-2"];

    final output = sut(input);

    expect(output, {
      "grid-column-start": 2,
      "grid-column-span": 2,
    });
  });

  test("grid column end with span", () {
    final input = ["col-end-4", "col-span-2"];

    final output = sut(input);

    expect(output, {
      "grid-column-start": 2,
      "grid-column-span": 2,
    });
  });

  test("grid column span is larger than column end", () {
    final input = ["col-end-3", "col-span-3"];

    final output = sut(input);

    expect(output, {});
  });

  test("grid column start end is not a number", () {
    final input = ["col-start-abc", "col-end-xyz"];

    final output = sut(input);

    expect(output, {});
  });
}
