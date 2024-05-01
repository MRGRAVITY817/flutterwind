import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwind/src/parse_style/filter_styles/filter_styles.dart';

void main() {
  final sut = filterStyles;

  group("filter styles", () {
    test("breakpoints", () {
      final classes = ["h-12", "sm:h-24", "md:h-36", "lg:h-48", "xl:h-60"];
      final double width = 800;

      final output = sut(
        classes: classes,
        width: width,
      );

      expect(output, ["h-36"]);
    });
  });
}
