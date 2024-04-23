Map<String, double> parseSpacing({
  required List<String> classes,
  required Map<String, dynamic> prefixMap,
}) {
  // Every sides (priority low)
  final everySides = _valueFromClasses(classes, "${prefixMap["every"]}-");
  // Axial sides (priority medium)
  final xSides = _valueFromClasses(classes, "${prefixMap["x"]}-");
  final ySides = _valueFromClasses(classes, "${prefixMap["y"]}-");
  // Individual sides (priority high)
  final top = _valueFromClasses(classes, "${prefixMap["t"]}-");
  final right = _valueFromClasses(classes, "${prefixMap["r"]}-");
  final bottom = _valueFromClasses(classes, "${prefixMap["b"]}-");
  final left = _valueFromClasses(classes, "${prefixMap["l"]}-");

  return {
    prefixMap["t"]: top ?? ySides ?? everySides ?? 0,
    prefixMap["b"]: bottom ?? ySides ?? everySides ?? 0,
    prefixMap["r"]: right ?? xSides ?? everySides ?? 0,
    prefixMap["l"]: left ?? xSides ?? everySides ?? 0,
  };
}

double? _valueFromClasses(List<String> input, String prefix) {
  final classWithPrefix = input.firstWhere(
    (element) => element.startsWith(prefix),
    orElse: () => "",
  );
  if (classWithPrefix.isEmpty) {
    return null;
  }

  final value = classWithPrefix.substring(prefix.length);
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
