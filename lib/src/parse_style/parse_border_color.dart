import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';

/// Parse border color classes to map.
///
/// Example:
/// ```dart
/// final classes = ["border-red-500"];
/// final output = parseBorderColor(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "border-color": Color(0xFFEF4444),
/// }
Map<String, Color> parseBorderColor(List<String> classes) {
  final classesWithBorderPrefix =
      classes.where((e) => e.startsWith("border-")).toList();

  if (classesWithBorderPrefix.isEmpty || classesWithBorderPrefix.length > 1) {
    return {
      "border-color": Color(defaultColorPalette["transparent"]!),
    };
  }

  final borderColor = classesWithBorderPrefix.first;
  final colorWithOpacity = borderColor.replaceFirst("border-", "").split("/");
  final colorFromPalette = defaultColorPalette[colorWithOpacity[0]];
  final opacity = colorWithOpacity.length > 1
      ? (double.tryParse(colorWithOpacity[1]) ?? 100.0) * 0.01
      : 1.0;

  if (colorFromPalette == null) {
    return {
      "border-color": Color(defaultColorPalette["transparent"]!),
    };
  }

  return {
    "border-color": Color(colorFromPalette).withOpacity(opacity),
  };
}
