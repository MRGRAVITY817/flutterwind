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
  final colorWithOpacity = bgColor.replaceFirst("bg-", "").split("/");
  final colorFromPalette = defaultColorPalette[colorWithOpacity[0]];
  final opacity = colorWithOpacity.length > 1
      ? (double.tryParse(colorWithOpacity[1]) ?? 100.0) * 0.01
      : 1.0;

  if (colorFromPalette == null) {
    return {
      "bgColor": Color(defaultColorPalette["transparent"]!),
    };
  }

  return {
    "bgColor": Color(colorFromPalette).withOpacity(opacity),
  };
}
