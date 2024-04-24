import 'package:flutterwind/src/parse_style/parse_background_color.dart';
import 'package:flutterwind/src/parse_style/parse_color.dart';
import 'package:flutterwind/src/parse_style/parse_height_width.dart';
import 'package:flutterwind/src/parse_style/parse_spacing.dart';

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
    ...parseHeightWidth(classes),
    ...parsePadding(classes),
    ...parseMargin(classes),
    ...parseBackgroundColor(classes),
    ...parseColor(classes, [
      "bg",
      "dark:bg",
      "border",
      "dark:border",
      "text",
      "dark:text",
    ]),
  };
}
