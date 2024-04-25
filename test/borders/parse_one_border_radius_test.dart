import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/borders/parse_border_radius.dart';

void main() {
  group("parse one border radius", () {
    final sut = parseOneBorderRadius;
    test("rounded", () {
      final input = "rounded";

      final output = sut(input);

      expect(output['border-radius-tl'], 4.0);
      expect(output['border-radius-tr'], 4.0);
      expect(output['border-radius-br'], 4.0);
      expect(output['border-radius-bl'], 4.0);
    });
  });
}
