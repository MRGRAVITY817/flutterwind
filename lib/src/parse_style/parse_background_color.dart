import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';

/// Parse background color classes to map.
///
/// Example:
/// ```dart
/// final classes = ["bg-red-500"];
/// final output = parseBackgroundColor(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "bgColor": Color(0xFFEF4444),
/// }
Map<String, Color> parseBackgroundColor(List<String> classes) {
  final classesWithBgPrefix =
      classes.where((e) => e.startsWith("bg-")).toList();

  if (classesWithBgPrefix.isEmpty || classesWithBgPrefix.length > 1) {
    return {
      "bgColor": Color(defaultColorPalette["transparent"]!),
    };
  }

  final bgColor = classesWithBgPrefix.first;
  final color = bgColor.replaceFirst("bg-", "");
  final colorFromPalette = defaultColorPalette[color];

  if (colorFromPalette == null) {
    return {
      "bgColor": Color(defaultColorPalette["transparent"]!),
    };
  }

  return {
    "bgColor": Color(colorFromPalette),
  };
}
