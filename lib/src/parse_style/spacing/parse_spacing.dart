import 'package:flutterwind/src/parse_style/value_from_classes.dart';

Map<String, double> parseSpacing({
  required List<String> classes,
  required Map<String, dynamic> prefixMap,
}) {
  // Every sides (priority low)
  final everySides = _extractValue(classes, "${prefixMap["every"]}-");
  // Axial sides (priority medium)
  final xSides = _extractValue(classes, "${prefixMap["x"]}-");
  final ySides = _extractValue(classes, "${prefixMap["y"]}-");
  // Individual sides (priority high)
  final top = _extractValue(classes, "${prefixMap["t"]}-");
  final right = _extractValue(classes, "${prefixMap["r"]}-");
  final bottom = _extractValue(classes, "${prefixMap["b"]}-");
  final left = _extractValue(classes, "${prefixMap["l"]}-");

  if (top == null &&
      right == null &&
      bottom == null &&
      left == null &&
      xSides == null &&
      ySides == null &&
      everySides == null) {
    return {};
  }

  return {
    prefixMap["t"]: top ?? ySides ?? everySides ?? 0,
    prefixMap["b"]: bottom ?? ySides ?? everySides ?? 0,
    prefixMap["r"]: right ?? xSides ?? everySides ?? 0,
    prefixMap["l"]: left ?? xSides ?? everySides ?? 0,
  };
}

double? _extractValue(List<String> input, String prefix) {
  final value = valueFromClasses(input, prefix);

  if (value == null) return null;

  return double.tryParse(value);
}
