import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/spacing/parse_margin.dart';

void main() {
  // system under test
  final sut = parseMargin;

  group('parse margin', () {
    test('no margin', () {
      final input = <String>[];

      final output = sut(input);

      expect(output, {});
    });

    test('margin all sides', () {
      final input = ["m-4"];

      final output = sut(input);

      expect(output, {
        'mt': 16.0,
        'mr': 16.0,
        'mb': 16.0,
        'ml': 16.0,
      });
    });

    test('margin only left', () {
      final input = ["ml-4"];

      final output = sut(input);

      expect(output, {
        'mt': 0,
        'mr': 0,
        'mb': 0,
        'ml': 16.0,
      });
    });

    test('margin only right', () {
      final input = ["mr-4"];

      final output = sut(input);

      expect(output, {
        'mt': 0,
        'mr': 16.0,
        'mb': 0,
        'ml': 0,
      });
    });

    test('margin only top', () {
      final input = ["mt-4"];

      final output = sut(input);

      expect(output, {
        'mt': 16.0,
        'mr': 0,
        'mb': 0,
        'ml': 0,
      });
    });

    test('margin only bottom', () {
      final input = ["mb-4"];

      final output = sut(input);

      expect(output, {
        'mt': 0,
        'mr': 0,
        'mb': 16.0,
        'ml': 0,
      });
    });

    test('margin all sides with different amount', () {
      final input = ["mt-4", "mr-8", "mb-12", "ml-16"];

      final output = sut(input);

      expect(output, {
        'mt': 16.0,
        'mr': 32.0,
        'mb': 48.0,
        'ml': 64.0,
      });
    });

    test('m-x comes first, then ml-4', () {
      final input = ["m-8", "ml-4"];

      final output = sut(input);

      expect(output, {
        'mt': 32.0,
        'mr': 32.0,
        'mb': 32.0,
        'ml': 16.0,
      });
    });

    test('ml-4 comes first, then m-8', () {
      final input = ["ml-4", "m-8"];

      final output = sut(input);

      expect(output, {
        'mt': 32.0,
        'mr': 32.0,
        'mb': 32.0,
        'ml': 32.0,
      });
    });

    test('m-x comes first, then ml-4, then mr-8', () {
      final input = ["m-16", "ml-4", "mr-8"];

      final output = sut(input);

      expect(output, {
        'mt': 64.0,
        'mr': 32.0,
        'mb': 64.0,
        'ml': 16.0,
      });
    });

    test('mx-x comes first, then ml-4, then mr-8, then mt-12', () {
      final input = ["mx-16", "ml-4", "mr-8", "mt-12"];

      final output = sut(input);

      expect(output, {
        'mt': 48.0,
        'mr': 32.0,
        'mb': 0.0,
        'ml': 16.0,
      });
    });
  });
}
