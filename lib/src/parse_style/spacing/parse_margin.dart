import 'package:flutterwind/src/parse_style/spacing/parse_spacing.dart';

/// Parse margin classes to map.
///
/// Example:
/// ```dart
/// final classes = ["m-4", "mt-4", "mr-4", "mb-4", "ml-4"];
/// final output = parseMargin(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "mt": 4.0,
///   "mr": 4.0,
///   "mb": 4.0,
///   "ml": 4.0,
/// }
Map<String, double> parseMargin(List<String> classes) {
  return parseSpacing(
    classes: classes,
    prefixMap: {
      "every": "m",
      "x": "mx",
      "y": "my",
      "t": "mt",
      "r": "mr",
      "b": "mb",
      "l": "ml",
    },
  );
}
