import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_height_width.dart';

void main() {
  group("parse height and width", () {
    final sut = parseHeightWidth;

    test("parse height and width", () {
      final input = ["h-12", "w-24"];

      final output = sut(input);

      expect(output['h'], 12.0);
      expect(output['w'], 24.0);
    });
  });
}
