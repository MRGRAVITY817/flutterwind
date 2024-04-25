import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/parse_background_color.dart';
import 'package:flutterwind/src/parse_style/parse_border_radius.dart';
import 'package:flutterwind/src/parse_style/parse_border_width.dart';
import 'package:flutterwind/src/parse_style/parse_color.dart';
import 'package:flutterwind/src/parse_style/parse_sizing.dart';
import 'package:flutterwind/src/parse_style/parse_spacing.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_size.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_variant_numeric.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_weight.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_style.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_align.dart';

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
Map<String, dynamic> parseStyle(String style, Size size) {
  final classes = style.split(" ");

  return {
    ...parseSize(classes),
    ...parseHeightWidth(classes, size),
    ...parsePadding(classes),
    ...parseMargin(classes),
    ...parseBorderRadius(classes),
    ...parseBorderWidth(classes),
    ...parseBackgroundColor(classes),
    ...parseColor(
      classes,
      [
        "bg",
        "dark:bg",
        "border",
        "dark:border",
        "text",
        "dark:text",
      ],
    ),
    // Typography
    ...parseFontSize(classes),
    ...parseFontWeight(classes),
    ...parseFontStyle(classes),
    ...parseTextAlign(classes),
    ...parseFontVariantNumeric(classes),
  };
}
