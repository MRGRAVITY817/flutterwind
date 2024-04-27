import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse justify content classes.
///
/// Supported classes:
/// - justify-start
/// - justify-end
/// - justify-center
/// - justify-between
/// - justify-around
/// - justify-evenly
///
/// `justify-stretch` is not supported because it's not a valid value for `MainAxisAlignment`.
/// It's advised to use `FwFlexible` to stretch the child widget.
///
/// Example:
/// ```dart
/// final classes = ["justify-start"];
/// final output = parseJustifyContent(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "justify-content": MainAxisAlignment.start,
/// }
/// ```
Map<String, MainAxisAlignment> parseJustifyContent(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: justifyContentMap,
    mapKey: "justify-content",
  );
}

Map<String, MainAxisAlignment> justifyContentMap = {
  "justify-start": MainAxisAlignment.start,
  "justify-end": MainAxisAlignment.end,
  "justify-center": MainAxisAlignment.center,
  "justify-between": MainAxisAlignment.spaceBetween,
  "justify-around": MainAxisAlignment.spaceAround,
  "justify-evenly": MainAxisAlignment.spaceEvenly,
};
