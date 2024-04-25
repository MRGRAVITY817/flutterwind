import 'package:flutterwind/src/parse_style/value_from_classes.dart';

/// Parse size classes.
/// Size class is used to set both height and width with the same value.
///
/// Example:
/// ```dart
/// final classes = ["size-12"];
/// final output = parseSize(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "h": 12.0,
///   "w": 12.0,
/// }
/// ```
Map<String, double?> parseSize(List<String> classes) {
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
