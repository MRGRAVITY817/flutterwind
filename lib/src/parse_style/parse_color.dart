import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/default_color_palette.dart';

/// Parse color classes to map.
///
/// Example:
/// ```dart
/// final classes = ["bg-red-500", "border-teal-300/50", "dark:bg-blue-500/20"];
/// final output = parseColors(classes, ["bg", "border", "dark:bg"]);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "bg-color": Color(0xFFEF4444),
///   "border-color": Color(0xFF4FD1C5).withOpacity(0.5),
///   "dark:bg-color": Color(0xFF2563EB).withOpacity(0.2),
/// }
Map<String, Color> parseColor(List<String> classes, List<String> prefixes) {
  final colors = <String, Color>{};

  for (final prefix in prefixes) {
    colors.addAll(
      parseColorFromPrefix(
        classes
            .where(
              (c) => c.startsWith("$prefix-"),
            )
            .toList(),
        prefix,
      ),
    );
  }

  return colors;
}

Map<String, Color> parseColorFromPrefix(List<String> classes, String prefix) {
  final mapKey = "$prefix-color";

  if (classes.isEmpty || classes.length > 1) {
    return {
      mapKey: Color(defaultColorPalette["transparent"]!),
    };
  }

  final colorWithOpacity =
      classes.first.replaceFirst("$prefix-", "").split("/");

  final colorFromPalette = defaultColorPalette[colorWithOpacity[0]];
  final opacity = colorWithOpacity.length > 1
      ? (double.tryParse(colorWithOpacity[1]) ?? 100.0) * 0.01
      : 1.0;

  if (colorFromPalette == null) {
    return {
      mapKey: Color(defaultColorPalette["transparent"]!),
    };
  }

  return {
    mapKey: Color(colorFromPalette).withOpacity(opacity),
  };
}
