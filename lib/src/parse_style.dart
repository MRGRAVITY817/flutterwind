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
  final paddingMap = <String, double>{
    "pt": 0,
    "pr": 0,
    "pb": 0,
    "pl": 0,
  };

  for (final className in classes) {
    if (className.startsWith("p-")) {
      final padding = className.split("-")[1];
      paddingMap["pt"] = double.parse(padding);
      paddingMap["pr"] = double.parse(padding);
      paddingMap["pb"] = double.parse(padding);
      paddingMap["pl"] = double.parse(padding);
    } else if (className.startsWith("pt-")) {
      final padding = className.split("-")[1];
      paddingMap["pt"] = double.parse(padding);
    } else if (className.startsWith("pr-")) {
      final padding = className.split("-")[1];
      paddingMap["pr"] = double.parse(padding);
    } else if (className.startsWith("pb-")) {
      final padding = className.split("-")[1];
      paddingMap["pb"] = double.parse(padding);
    } else if (className.startsWith("pl-")) {
      final padding = className.split("-")[1];
      paddingMap["pl"] = double.parse(padding);
    }
  }

  return paddingMap;
}
