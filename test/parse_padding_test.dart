import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style.dart';

void main() {
  group('parse padding', () {
    test('p-4', () {
      final style = "p-4";

      final parsedStyle = parsePadding(style.split(" "));

      expect(parsedStyle['pt'], 4.0);
      expect(parsedStyle['pr'], 4.0);
      expect(parsedStyle['pb'], 4.0);
      expect(parsedStyle['pl'], 4.0);
    });
  });
}
