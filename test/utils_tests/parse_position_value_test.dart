import "package:test/test.dart";
import 'package:flutterwind/src/parse_style/defaults/default_spacing_scale.dart';
import 'package:flutterwind/src/parse_style/spacing/spacing_constants.dart';
import 'package:flutterwind/src/parse_style/utils/parse_position_value.dart';

void main() {
  final sut = parsePositionValue;

  group("parse position value", () {
    test("p-4", () {
      final output = sut(
        className: "p-4",
        positionList: spacingPositionList,
        positionMap: spacingPositionMap,
        valueMap: defaultSpacingScale,
        defaultValue: defaultSpacingScale["1"],
        prefix: "p",
        separatePrefixAndPosition: true,
      );

      expect(output, {
        "pt": 16.0,
        "pr": 16.0,
        "pb": 16.0,
        "pl": 16.0,
      });
    });

    test("px-4", () {
      final output = sut(
        className: "px-4",
        positionList: spacingPositionList,
        positionMap: spacingPositionMap,
        valueMap: defaultSpacingScale,
        defaultValue: defaultSpacingScale["1"],
        prefix: "p",
        separatePrefixAndPosition: true,
      );

      expect(output, {
        "pr": 16.0,
        "pl": 16.0,
      });
    });
  });
}
