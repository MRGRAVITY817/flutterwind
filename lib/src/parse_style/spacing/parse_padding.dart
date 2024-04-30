import 'package:flutterwind/src/parse_style/defaults/default_spacing_scale.dart';
import 'package:flutterwind/src/parse_style/spacing/spacing_constants.dart';
import 'package:flutterwind/src/parse_style/utils/parse_position_value.dart';

/// Parse padding classes to map.
///
/// Example:
/// ```dart
/// final classes = ["p-4", "m-4", "bg-red-500"];
/// final output = parsePadding(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "pt": 4.0,
///   "pr": 4.0,
///   "pb": 4.0,
///   "pl": 4.0,
/// }
Map<String, double> parsePadding(List<String> classes) {
  final onlyPaddingClasses =
      classes.where((e) => _prefixList.any(e.startsWith)).toList();

  if (onlyPaddingClasses.isEmpty) {
    return {};
  }

  final paddingMap = onlyPaddingClasses
      .map(parseOnePadding)
      .fold(_noPadding, (value, element) => {...value, ...element});

  return paddingMap;
}

Map<String, dynamic> parseOnePadding(String className) {
  return parsePositionValue(
    className: className,
    prefix: "p",
    positionMap: spacingPositionMap,
    positionList: spacingPositionList,
    valueMap: defaultSpacingScale,
    defaultValue: defaultSpacingScale["1"],
    separatePrefixAndPosition: true,
  );
}

const Map<String, double> _noPadding = {
  "pt": 0.0,
  "pr": 0.0,
  "pb": 0.0,
  "pl": 0.0,
};

List<String> _prefixList = [
  "p-",
  "pt-",
  "pr-",
  "pb-",
  "pl-",
  "px-",
  "py-",
];
