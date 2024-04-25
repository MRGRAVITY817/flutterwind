import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the text decoration classes
///
/// The text decoration classes are:
/// - underline
/// - line-through
/// - overline
///
/// Example:
/// ```dart
/// final classes = ["underline"];
/// final output = parseTextDecoration(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "text-decoration": TextDecoration.underline,
/// }
/// ```
Map<String, TextDecoration> parseTextDecoration(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textDecorationMap,
    mapKey: "text-decoration",
  );
}

Map<String, TextDecoration> textDecorationMap = {
  "no-underline": TextDecoration.none,
  "underline": TextDecoration.underline,
  "line-through": TextDecoration.lineThrough,
  "overline": TextDecoration.overline,
};
