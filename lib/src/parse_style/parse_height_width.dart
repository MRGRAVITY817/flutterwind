import 'package:flutterwind/src/parse_style/value_from_classes.dart';

/// Parse height and width classes.
///
/// Example:
/// ```dart
/// final classes = ["h-12", "w-24"];
/// final output = parseHeightWidth(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "h": 12.0,
///   "w": 24.0,
/// }
/// ```
Map<String, double?> parseHeightWidth(List<String> classes) {
  double? tryParseWithPrefix(String prefix) {
    return double.tryParse(valueFromClasses(classes, prefix) ?? "");
  }

  return {
    "h": tryParseWithPrefix("h-"),
    "w": tryParseWithPrefix("w-"),
  };
}
