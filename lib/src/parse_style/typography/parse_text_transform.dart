import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the text transform classes
///
/// The text transform classes are:
/// - uppercase
/// - lowercase
/// - capitalize
/// - normal-case
///
/// Example:
/// ```dart
/// final classes = ["uppercase"];
/// final output = parseTextTransform(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "text-transform": (String value) => value.toUpperCase(),
/// }
/// ```
Map<String, String Function(String)> parseTextTransform(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textTransformMap,
    mapKey: "text-transform",
  );
}

Map<String, String Function(String)> textTransformMap = {
  "uppercase": (String value) => value.toUpperCase(),
  "lowercase": (String value) => value.toLowerCase(),
  "capitalize": (String value) {
    return value
        .split(" ")
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(" ");
  },
  "normal-case": (String value) => value,
};
