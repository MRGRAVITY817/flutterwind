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
  final paddingMap = <String, double>{};

  for (final className in classes) {
    if (className.startsWith("p-")) {
      final padding = className.split("-")[1];
      paddingMap["pt"] = double.parse(padding);
      paddingMap["pr"] = double.parse(padding);
      paddingMap["pb"] = double.parse(padding);
      paddingMap["pl"] = double.parse(padding);
    }
  }

  return paddingMap;
}
