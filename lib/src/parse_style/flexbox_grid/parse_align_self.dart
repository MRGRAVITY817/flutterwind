import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse align self classes.
///
/// Supported classes:
/// - self-start
/// - self-end
/// - self-center
/// - self-stretch
/// - self-baseline
///
/// `self-auto` is not supported because it's not a valid value for `CrossAxisAlignment`.
/// It's advised to use `FwFlexible` to stretch the child widget.
///
/// Example:
/// ```dart
/// final classes = ["self-start"];
/// final output = parseAlignSelf(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "align-self": CrossAxisAlignment.start,
/// }
/// ```
Map<String, CrossAxisAlignment> parseAlignSelf(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: alignSelfMap,
    mapKey: "align-self",
  );
}

Map<String, CrossAxisAlignment> alignSelfMap = {
  "self-start": CrossAxisAlignment.start,
  "self-end": CrossAxisAlignment.end,
  "self-center": CrossAxisAlignment.center,
  "self-stretch": CrossAxisAlignment.stretch,
  "self-baseline": CrossAxisAlignment.baseline,
};
