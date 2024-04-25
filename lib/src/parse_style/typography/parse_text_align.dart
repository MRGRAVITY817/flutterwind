import 'package:flutter/material.dart';

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
  final matchedClasses =
      classes.where((c) => textAlignClassMap.keys.contains(c));

  if (matchedClasses.isEmpty || matchedClasses.length > 1) {
    return {};
  }

  final textAlign = textAlignClassMap[matchedClasses.first];

  return textAlign != null ? {"text-align": textAlign} : {};
}

const Map<String, TextAlign> textAlignClassMap = {
  "text-left": TextAlign.left,
  "text-center": TextAlign.center,
  "text-right": TextAlign.right,
  "text-justify": TextAlign.justify,
  "text-start": TextAlign.start,
  "text-end": TextAlign.end,
};
