import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

void main() {
  final sut = parseStyle;
  final size = Size(300, 400);

  group("parse size/width/height", () {
    test("parse size/width/height", () {
      final input = "size-12 w-24 h-36";

      final output = sut(input, size);

      expect(output, {'h': 144.0, 'w': 96.0});
    });
  });
}
