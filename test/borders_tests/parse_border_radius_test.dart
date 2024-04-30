import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/borders/parse_border_radius.dart';

void main() {
  group('parse border radius', () {
    final sut = parseBorderRadius;

    test('parse border radius', () {
      final input = ['rounded-lg'];

      final output = sut(input);

      expect(output['rounded-tl'], 8.0);
      expect(output['rounded-tr'], 8.0);
      expect(output['rounded-br'], 8.0);
      expect(output['rounded-bl'], 8.0);
    });

    test('each border corners', () {
      final input = [
        'rounded-tl',
        'rounded-tr-md',
        'rounded-br-lg',
        'rounded-bl-xl'
      ];

      final output = sut(input);

      expect(output['rounded-tl'], 4.0);
      expect(output['rounded-tr'], 6.0);
      expect(output['rounded-br'], 8.0);
      expect(output['rounded-bl'], 12.0);
    });

    test('parse border radius with empty input', () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });

    test('parse border radius with multiple rounded classes', () {
      final input = ['rounded-lg', 'rounded-tl-md'];

      final output = sut(input);

      expect(output['rounded-tl'], 6.0);
      expect(output['rounded-tr'], 8.0);
      expect(output['rounded-br'], 8.0);
      expect(output['rounded-bl'], 8.0);
    });

    test('parse border radius with invalid rounded class', () {
      final input = ['rounded-invalid'];

      final output = sut(input);

      expect(output['rounded-tl'], 0.0);
      expect(output['rounded-tr'], 0.0);
      expect(output['rounded-br'], 0.0);
      expect(output['rounded-bl'], 0.0);
    });

    test('parse border radius with empty rounded class', () {
      final input = ['rounded-'];

      final output = sut(input);

      expect(output['rounded-tl'], 0.0);
      expect(output['rounded-tr'], 0.0);
      expect(output['rounded-br'], 0.0);
      expect(output['rounded-bl'], 0.0);
    });
  });
}
