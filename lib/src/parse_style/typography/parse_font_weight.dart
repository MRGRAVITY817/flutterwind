import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the font weight classes
///
/// The font weight classes are:
/// - font-thin
/// - font-extralight
/// - font-light
/// - font-normal
/// - font-medium
/// - font-semibold
/// - font-bold
/// - font-extrabold
/// - font-black
///
/// Example:
/// ```dart
/// final classes = ["font-bold"];
/// final output = parseFontWeight(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "font-weight": FontWeight.bold,
/// }
/// ```
Map<String, FontWeight> parseFontWeight(List<String> classes) {
  final fontWeight = matchOneClass(
    classes: classes,
    classMap: fontWeightClassMap,
  );

  return fontWeight != null ? {"font-weight": fontWeight} : {};
}

const Map<String, FontWeight> fontWeightClassMap = {
  "font-thin": FontWeight.w100,
  "font-extralight": FontWeight.w200,
  "font-light": FontWeight.w300,
  "font-normal": FontWeight.w400,
  "font-medium": FontWeight.w500,
  "font-semibold": FontWeight.w600,
  "font-bold": FontWeight.w700,
  "font-extrabold": FontWeight.w800,
  "font-black": FontWeight.w900,
};
