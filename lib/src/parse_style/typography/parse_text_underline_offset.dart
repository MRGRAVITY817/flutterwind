import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the text underline offset classes
///
/// The text underline offset classes are:
/// - underline-offset-{value}
///
/// Example:
/// ```dart
/// final classes = ["underline-offset-4"];
/// final output = parseTextUnderlineOffset(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "text-underline-offset": 4.0,
/// }
/// ```
Map<String, double> parseTextUnderlineOffset(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textUnderlineOffsetMap,
    mapKey: "text-underline-offset",
  );
}

const Map<String, double> textUnderlineOffsetMap = {
  "underline-offset-0": 0.0,
  "underline-offset-1": 1.0,
  "underline-offset-2": 2.0,
  "underline-offset-4": 4.0,
  "underline-offset-8": 8.0,
};

// TODO: implement `underline-offset-auto`
