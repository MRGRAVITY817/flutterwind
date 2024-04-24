import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_border_radius.dart';

void main() {
  group('parse border radius', () {
    final sut = parseBorderRadius;

    test('parse border radius', () {
      final input = ['rounded-lg'];

      final output = sut(input);

      expect(output['border-radius-tl'], 8.0);
      expect(output['border-radius-tr'], 8.0);
      expect(output['border-radius-br'], 8.0);
      expect(output['border-radius-bl'], 8.0);
    });

    test('each border corners', () {
      final input = [
        'rounded-tl',
        'rounded-tr-md',
        'rounded-br-lg',
        'rounded-bl-xl'
      ];

      final output = sut(input);

      expect(output['border-radius-tl'], 4.0);
      expect(output['border-radius-tr'], 6.0);
      expect(output['border-radius-br'], 8.0);
      expect(output['border-radius-bl'], 12.0);
    });

    test('parse border radius with empty input', () {
      final input = <String>[];

      final output = sut(input);

      expect(output['border-radius-tl'], 0.0);
      expect(output['border-radius-tr'], 0.0);
      expect(output['border-radius-br'], 0.0);
      expect(output['border-radius-bl'], 0.0);
    });

    test('parse border radius with multiple rounded classes', () {
      final input = ['rounded-lg', 'rounded-tl-md'];

      final output = sut(input);

      expect(output['border-radius-tl'], 6.0);
      expect(output['border-radius-tr'], 8.0);
      expect(output['border-radius-br'], 8.0);
      expect(output['border-radius-bl'], 8.0);
    });

    test('parse border radius with invalid rounded class', () {
      final input = ['rounded-invalid'];

      final output = sut(input);

      expect(output['border-radius-tl'], 0.0);
      expect(output['border-radius-tr'], 0.0);
      expect(output['border-radius-br'], 0.0);
      expect(output['border-radius-bl'], 0.0);
    });

    test('parse border radius with empty rounded class', () {
      final input = ['rounded-'];

      final output = sut(input);

      expect(output['border-radius-tl'], 0.0);
      expect(output['border-radius-tr'], 0.0);
      expect(output['border-radius-br'], 0.0);
      expect(output['border-radius-bl'], 0.0);
    });
  });
}
