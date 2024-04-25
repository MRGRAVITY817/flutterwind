import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_transform.dart';

void main() {
  final sut = parseTextTransform;

  group("parse text transform", () {
    test("uppercase", () {
      final input = ["uppercase"];

      final output = sut(input);

      expect(output.containsKey("text-transform"), true);
      expect(output["text-transform"]!("hello"), "HELLO");
    });

    test("multiple text transforms", () {
      final input = ["uppercase", "lowercase"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
