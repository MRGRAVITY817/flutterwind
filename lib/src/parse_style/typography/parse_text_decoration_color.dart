import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/parse_color.dart';

/// Parses the text decoration color classes
///
/// The text decoration color classes are:
/// - decoration-{color}
///
/// Example:
/// ```dart
/// final classes = ["decoration-sky-400"];
/// final output = parseTextDecorationColor(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "text-decoration-color": Color(0xFF90CDF4),
/// }
/// ```
Map<String, Color> parseTextDecorationColor(List<String> classes) {
  return parseColor(classes, ["decoration"]);
}

