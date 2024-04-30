import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/borders/parse_border_radius.dart';

void main() {
  group("parse one border radius", () {
    final sut = parseOneBorderRadius;
    test("rounded", () {
      final input = "rounded";

      final output = sut(input);

      expect(output['rounded-tl'], 4.0);
      expect(output['rounded-tr'], 4.0);
      expect(output['rounded-br'], 4.0);
      expect(output['rounded-bl'], 4.0);
    });
  });
}
