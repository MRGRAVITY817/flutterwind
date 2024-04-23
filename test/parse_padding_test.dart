import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style.dart';

void main() {
  // system under test
  final sut = parsePadding;

  group('parse padding', () {
    test('padding every direction with same amount', () {
      final input = ["p-4"];

      final output = sut(input);

      expect(output['pt'], 4.0);
      expect(output['pr'], 4.0);
      expect(output['pb'], 4.0);
      expect(output['pl'], 4.0);
    });

    test('padding only left', () {
      final input = ["pl-4"];

      final output = sut(input);

      expect(output['pt'], 0);
      expect(output['pr'], 0);
      expect(output['pb'], 0);
      expect(output['pl'], 4.0);
    });

    test('padding only right', () {
      final input = ["pr-4"];

      final output = sut(input);

      expect(output['pt'], 0);
      expect(output['pr'], 4.0);
      expect(output['pb'], 0);
      expect(output['pl'], 0);
    });

    test('padding only top', () {
      final input = ["pt-4"];

      final output = sut(input);

      expect(output['pt'], 4.0);
      expect(output['pr'], 0);
      expect(output['pb'], 0);
      expect(output['pl'], 0);
    });

    test('padding only bottom', () {
      final input = ["pb-4"];

      final output = sut(input);

      expect(output['pt'], 0);
      expect(output['pr'], 0);
      expect(output['pb'], 4.0);
      expect(output['pl'], 0);
    });

    test('padding every direction with different amount', () {
      final input = ["pt-4", "pr-8", "pb-12", "pl-16"];

      final output = sut(input);

      expect(output['pt'], 4.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 12.0);
      expect(output['pl'], 16.0);
    });
  });
}
