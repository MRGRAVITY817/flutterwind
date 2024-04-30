import 'package:flutterwind/src/parse_style/utils/parse_position_value.dart';

/// Parse border radius classes.
///
/// Example:
/// ```dart
/// final classes = ["rounded", "rounded-lg", "rounded-tl-md"];
/// final output = parseBorderRadius(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "rounded-tl": 4.0,
///   "rounded-tr": 6.0,
///   "rounded-br": 8.0,
///   "rounded-bl": 12.0,
/// }
/// ```
Map<String, double> parseBorderRadius(List<String> classes) {
  final onlyRoundedClasses =
      classes.where((e) => e.startsWith("rounded")).toList();

  if (onlyRoundedClasses.isEmpty) {
    return {};
  }

  // each classname can vary in details (ex) rounded, rounded-lg, rounded-tl-md, etc.
  // The more detailed class should override the less detailed class.
  final borderRadius = onlyRoundedClasses
      .map(parseOneBorderRadius)
      .fold(_noRadius, (value, element) => {...value, ...element});

  return borderRadius;
}

Map<String, dynamic> parseOneBorderRadius(String className) {
  return parsePositionValue(
    className: className,
    prefix: "rounded",
    positionMap: _cornerMap,
    positionList: _everyCorners,
    valueMap: _sizeMap,
    defaultValue: 4.0,
  );
}

const List<String> _everyCorners = ["tl", "tr", "br", "bl"];

const _noRadius = <String, double>{
  "rounded-tl": 0.0,
  "rounded-tr": 0.0,
  "rounded-br": 0.0,
  "rounded-bl": 0.0
};

const Map<String, List<String>> _cornerMap = {
  "t": ["tl", "tr"],
  "r": ["tr", "br"],
  "b": ["br", "bl"],
  "l": ["bl", "tl"],
  "tl": ["tl"],
  "tr": ["tr"],
  "br": ["br"],
  "bl": ["bl"],
};

const Map<String, double> _sizeMap = {
  "none": 0.0,
  "sm": 2.0,
  "md": 6.0,
  "lg": 8.0,
  "xl": 12.0,
  "2xl": 16.0,
  "3xl": 20.0,
  "full": 9999.0,
};
