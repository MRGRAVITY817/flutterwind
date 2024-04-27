import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse justify items classes.
///
/// Supported classes:
/// - items-start
/// - items-end
/// - items-center
/// - items-stretch
/// - items-baseline
///
/// Example:
/// ```dart
/// final classes = ["items-start"];
/// final output = parseAlignItems(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "align-items": CrossAxisAlignment.start,
/// }
/// ```
Map<String, CrossAxisAlignment> parseAlignItems(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: alignItemsMap,
    mapKey: "align-items",
  );
}

Map<String, CrossAxisAlignment> alignItemsMap = {
  "items-start": CrossAxisAlignment.start,
  "items-end": CrossAxisAlignment.end,
  "items-center": CrossAxisAlignment.center,
  "items-stretch": CrossAxisAlignment.stretch,
  "items-baseline": CrossAxisAlignment.baseline,
};
