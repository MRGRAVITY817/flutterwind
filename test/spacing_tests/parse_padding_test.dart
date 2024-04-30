import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/spacing/parse_padding.dart';

void main() {
  // system under test
  final sut = parsePadding;

  group('parse padding', () {
    test('no padding', () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });

    test('padding all sides', () {
      final input = ["p-4"];

      final output = sut(input);

      expect(output, {
        'pt': 16.0,
        'pr': 16.0,
        'pb': 16.0,
        'pl': 16.0,
      });
    });

    test('padding only left', () {
      final input = ["pl-4"];

      final output = sut(input);

      expect(output, {
        'pt': 0,
        'pr': 0,
        'pb': 0,
        'pl': 16.0,
      });
    });

    test('padding only right', () {
      final input = ["pr-4"];

      final output = sut(input);

      expect(output, {
        'pt': 0,
        'pr': 16.0,
        'pb': 0,
        'pl': 0,
      });
    });

    test('padding only top', () {
      final input = ["pt-4"];

      final output = sut(input);

      expect(output, {
        'pt': 16.0,
        'pr': 0,
        'pb': 0,
        'pl': 0,
      });
    });

    test('padding only bottom', () {
      final input = ["pb-4"];

      final output = sut(input);

      expect(output, {
        'pt': 0,
        'pr': 0,
        'pb': 16.0,
        'pl': 0,
      });
    });

    test('padding all sides with different amount', () {
      final input = ["pt-4", "pr-8", "pb-12", "pl-16"];

      final output = sut(input);

      expect(output, {
        'pt': 16.0,
        'pr': 32.0,
        'pb': 48.0,
        'pl': 64.0,
      });
    });

    test('p-x comes first, then pl-4', () {
      final input = ["p-8", "pl-4"];

      final output = sut(input);

      expect(output, {
        'pt': 32.0,
        'pr': 32.0,
        'pb': 32.0,
        'pl': 16.0,
      });
    });

    test('pl-4 comes first, then p-8', () {
      final input = ["pl-4", "p-8"];

      final output = sut(input);

      expect(output, {
        'pt': 32.0,
        'pr': 32.0,
        'pb': 32.0,
        'pl': 32.0,
      });
    });

    test('p-x comes first, then pl-4, then pr-8', () {
      final input = ["p-16", "pl-4", "pr-8"];

      final output = sut(input);

      expect(output, {
        'pt': 64.0,
        'pr': 32.0,
        'pb': 64.0,
        'pl': 16.0,
      });
    });

    test('px-x comes first, then pl-4, then pr-8, then pt-12', () {
      final input = ["px-16", "pl-4", "pr-8", "pt-12"];

      final output = sut(input);

      expect(output, {
        'pt': 48.0,
        'pr': 32.0,
        'pb': 0.0,
        'pl': 16.0,
      });
    });
  });
}
