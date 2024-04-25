import 'package:test/test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_underline_offset.dart';

void main() {
  final sut = parseTextUnderlineOffset;

  group("parse text underline offset", () {
    test("underline offset", () {
      final input = ["underline-offset-1"];

      final output = sut(input);

      expect(output, {"text-underline-offset": 1.0});
    });

    test("multiple text underline offsets", () {
      final input = ["underline-offset-2", "underline-offset-8"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
