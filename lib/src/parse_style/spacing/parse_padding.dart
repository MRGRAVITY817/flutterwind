import 'package:flutterwind/src/parse_style/spacing/parse_spacing.dart';

/// Parse padding classes to map.
///
/// Example:
/// ```dart
/// final classes = ["p-4", "m-4", "bg-red-500"];
/// final output = parsePadding(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "pt": 4.0,
///   "pr": 4.0,
///   "pb": 4.0,
///   "pl": 4.0,
/// }
Map<String, double> parsePadding(List<String> classes) {
  return parseSpacing(
    classes: classes,
    prefixMap: {
      "every": "p",
      "x": "px",
      "y": "py",
      "t": "pt",
      "r": "pr",
      "b": "pb",
      "l": "pl",
    },
  );
}
