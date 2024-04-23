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

/// Parse margin classes to map.
///
/// Example:
/// ```dart
/// final classes = ["m-4", "mt-4", "mr-4", "mb-4", "ml-4"];
/// final output = parseMargin(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "mt": 4.0,
///   "mr": 4.0,
///   "mb": 4.0,
///   "ml": 4.0,
/// }
Map<String, double> parseMargin(List<String> classes) {
  return parseSpacing(
    classes: classes,
    prefixMap: {
      "every": "m",
      "x": "mx",
      "y": "my",
      "t": "mt",
      "r": "mr",
      "b": "mb",
      "l": "ml",
    },
  );
}
