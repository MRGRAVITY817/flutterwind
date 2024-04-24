import 'package:flutterwind/src/parse_style/value_from_classes.dart';

Map<String, double> parseSize(List<String> classes) {
  // if there's multiple `size-` classes, it will 0.0
  if (classes.where((className) => className.startsWith("size-")).length > 1) {
    return {"h": 0.0, "w": 0.0};
  }

  double? tryParseWithPrefix(String prefix) {
    return double.tryParse(valueFromClasses(classes, prefix) ?? "");
  }

  final size = tryParseWithPrefix("size-") ?? 0.0;

  return {"h": size, "w": size};
}
