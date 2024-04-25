import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the letter spacing classes
///
/// The letter spacing classes are:
/// - tracking-tighter
/// - tracking-tight
/// - tracking-normal
/// - tracking-wide
/// - tracking-wider
/// - tracking-widest
///
/// Example:
/// ```dart
/// final classes = ["tracking-tighter"];
/// final output = parseLetterSpacing(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "letter-spacing": -0.05,
/// }
/// ```
Map<String, double> parseLetterSpacing(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: letterSpacingClassMap,
    mapKey: "letter-spacing",
  );
}

const Map<String, double> letterSpacingClassMap = {
  "tracking-tighter": -0.05,
  "tracking-tight": -0.025,
  "tracking-normal": 0.0,
  "tracking-wide": 0.025,
  "tracking-wider": 0.05,
  "tracking-widest": 0.1,
};
