import 'package:flutterwind/src/parse_style/defaults/default_spacing_scale.dart';
import 'package:flutterwind/src/parse_style/spacing/spacing_constants.dart';
import 'package:flutterwind/src/parse_style/utils/parse_position_value.dart';

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
  final onlyMarginClasses =
      classes.where((e) => _prefixList.any(e.startsWith)).toList();

  if (onlyMarginClasses.isEmpty) {
    return {};
  }

  final marginMap = onlyMarginClasses
      .map(parseOneMargin)
      .fold(_noMargin, (value, element) => {...value, ...element});

  return marginMap;
}

Map<String, dynamic> parseOneMargin(String className) {
  return parsePositionValue(
    className: className,
    prefix: "m",
    positionMap: spacingPositionMap,
    positionList: spacingPositionList,
    valueMap: defaultSpacingScale,
    defaultValue: defaultSpacingScale["1"],
    separatePrefixAndPosition: true,
  );
}

const Map<String, double> _noMargin = {
  "mt": 0.0,
  "mr": 0.0,
  "mb": 0.0,
  "ml": 0.0,
};

List<String> _prefixList = [
  "m-",
  "mt-",
  "mr-",
  "mb-",
  "ml-",
  "mx-",
  "my-",
];
