import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_align_items.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_align_self.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_flex.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_flex_direction.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_cols_subgrid.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_column_start_end.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_row_start_end.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_rows.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_grid_template_columns.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_justify_content.dart';
import 'package:flutterwind/src/parse_style/parse_color.dart';
import 'package:flutterwind/src/parse_style/parse_sizing.dart';
import 'package:flutterwind/src/parse_style/parse_spacing.dart';
import 'package:flutterwind/src/parse_style/borders/parse_border_radius.dart';
import 'package:flutterwind/src/parse_style/borders/parse_border_width.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_size.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_variant_numeric.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_weight.dart';
import 'package:flutterwind/src/parse_style/typography/parse_font_style.dart';
import 'package:flutterwind/src/parse_style/typography/parse_letter_spacing.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_align.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_color.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_style.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_decoration_thickness.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_transform.dart';
import 'package:flutterwind/src/parse_style/typography/parse_text_underline_offset.dart';

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
    // Flexbox & Grid
    ...parseFlex(classes),
    ...parseFlexDirection(classes),
    ...parseJustifyContent(classes),
    ...parseAlignItems(classes),
    ...parseAlignSelf(classes),
    ...parseGridColumns(classes),
    ...parseGridColsSubgrid(classes),
    ...parseGridColumnStartEnd(classes),
    ...parseGridRows(classes),
    ...parseGridRowStartEnd(classes),
    // Typography
    ...parseFontSize(classes),
    ...parseFontWeight(classes),
    ...parseFontStyle(classes),
    ...parseLetterSpacing(classes),
    ...parseTextAlign(classes),
    ...parseTextDecoration(classes),
    ...parseTextDecorationColor(classes),
    ...parseTextDecorationStyle(classes),
    ...parseTextDecorationThickness(classes),
    ...parseTextUnderlineOffset(classes),
    ...parseFontVariantNumeric(classes),
    ...parseTextTransform(classes),
  };
}
