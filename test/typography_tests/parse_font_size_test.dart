import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_size.dart';

void main() {
  final sut = parseFontSize;

  group('parse font size', () {
    test('parse font size', () {
      final input = ["text-2xl"];

      final output = sut(input);

      expect(output, {"font-size": 24.0, "line-height": 32.0});
    });

    test('parse font size with multiple classes', () {
      final input = ["text-2xl", "text-3xl"];

      final output = sut(input);

      expect(output, {});
    });

    test('parse font size with no classes', () {
      final input = ["text-2x"];

      final output = sut(input);

      expect(output, {});
    });
  });
}
