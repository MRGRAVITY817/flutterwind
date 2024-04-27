import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse grid template columns classes.
///
/// Supported classes:
/// - grid-cols-1 ~ grid-cols-12
///
/// Example:
/// ```dart
/// final classes = ["grid-cols-1"];
/// final output = parseGridTemplateColumns(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "grid-cols": 1,
/// }
/// ```
Map<String, int> parseGridTemplateColumns(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: gridTemplateColumnsMap,
    mapKey: "grid-cols",
  );
}

Map<String, int> gridTemplateColumnsMap = {
  "grid-cols-1": 1,
  "grid-cols-2": 2,
  "grid-cols-3": 3,
  "grid-cols-4": 4,
  "grid-cols-5": 5,
  "grid-cols-6": 6,
  "grid-cols-7": 7,
  "grid-cols-8": 8,
  "grid-cols-9": 9,
  "grid-cols-10": 10,
  "grid-cols-11": 11,
  "grid-cols-12": 12,
};
