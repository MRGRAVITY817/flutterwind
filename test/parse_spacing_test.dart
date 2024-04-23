import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_spacing.dart';

void main() {
  // system under test
  final sut = parsePadding;

  group('parse padding', () {
    test('padding all sides', () {
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

    test('padding all sides with different amount', () {
      final input = ["pt-4", "pr-8", "pb-12", "pl-16"];

      final output = sut(input);

      expect(output['pt'], 4.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 12.0);
      expect(output['pl'], 16.0);
    });

    test('p-x comes first, then pl-4', () {
      final input = ["p-8", "pl-4"];

      final output = sut(input);

      expect(output['pt'], 8.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 8.0);
      expect(output['pl'], 4.0);
    });

    test('pl-4 comes first, then p-x', () {
      final input = ["pl-4", "p-8"];

      final output = sut(input);

      expect(output['pt'], 8.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 8.0);
      expect(output['pl'], 4.0);
    });

    test('p-x comes first, then pl-4, then pr-8', () {
      final input = ["p-16", "pl-4", "pr-8"];

      final output = sut(input);

      expect(output['pt'], 16.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 16.0);
      expect(output['pl'], 4.0);
    });

    test('px-x comes first, then pl-4, then pr-8, then pt-12', () {
      final input = ["px-16", "pl-4", "pr-8", "pt-12"];

      final output = sut(input);

      expect(output['pt'], 12.0);
      expect(output['pr'], 8.0);
      expect(output['pb'], 0.0);
      expect(output['pl'], 4.0);
    });
  });

  group("parse margin", () {
    final sut = parseMargin;

    test('margin all sides', () {
      final input = ["m-4"];

      final output = sut(input);

      expect(output['mt'], 4.0);
      expect(output['mr'], 4.0);
      expect(output['mb'], 4.0);
      expect(output['ml'], 4.0);
    });
  });
}
