import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses text align classes
///
/// Takes a list of classes and returns a map of text align properties
///
/// Example:
/// ```dart
/// final classes = ["text-left"];
/// final output = parseTextAlign(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "text-align": TextAlign.left,
/// }
/// ```
Map<String, TextAlign> parseTextAlign(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textAlignClassMap,
    mapKey: "text-align",
  );
}

const Map<String, TextAlign> textAlignClassMap = {
  "text-left": TextAlign.left,
  "text-center": TextAlign.center,
  "text-right": TextAlign.right,
  "text-justify": TextAlign.justify,
  "text-start": TextAlign.start,
  "text-end": TextAlign.end,
};
