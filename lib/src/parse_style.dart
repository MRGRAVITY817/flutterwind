/// Parse style string to map.
///
/// Example:
/// ```dart
/// final style = "p-4 m-4 bg-red-500";
/// final parsedStyle = parseStyle(style);
///
/// print(parsedStyle);
/// ```
///
/// Output:
/// ```
/// {
///   "padding": "4",
///   "margin": "4",
///   "background-color": "red-500",
/// }
Map<String, dynamic> parseStyle(String style) {
  final classes = style.split(" ");

  return {
    ...parsePadding(classes),
  };
}

Map<String, double> parsePadding(List<String> classes) {
  // Priority low
  final p = _valueFromClasses(classes, "p-");
  // Priority medium
  final px = _valueFromClasses(classes, "px-");
  final py = _valueFromClasses(classes, "py-");
  // Priority high
  final pt = _valueFromClasses(classes, "pt-");
  final pr = _valueFromClasses(classes, "pr-");
  final pb = _valueFromClasses(classes, "pb-");
  final pl = _valueFromClasses(classes, "pl-");

  return {
    "pt": pt ?? py ?? p ?? 0,
    "pb": pb ?? py ?? p ?? 0,
    "pr": pr ?? px ?? p ?? 0,
    "pl": pl ?? px ?? p ?? 0,
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
