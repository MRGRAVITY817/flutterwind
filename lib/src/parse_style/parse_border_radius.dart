const List<String> _everyCorners = ["tl", "tr", "br", "bl"];
const _noRadius = <String, double>{
  "border-radius-tl": 0.0,
  "border-radius-tr": 0.0,
  "border-radius-br": 0.0,
  "border-radius-bl": 0.0
};

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
///   "border-radius-tl": 4.0,
///   "border-radius-tr": 6.0,
///   "border-radius-br": 8.0,
///   "border-radius-bl": 12.0,
/// }
/// ```
Map<String, double> parseBorderRadius(List<String> classes) {
  final onlyRoundedClasses =
      classes.where((e) => e.startsWith("rounded")).toList();

  if (onlyRoundedClasses.isEmpty) {
    return _noRadius;
  }

  // each classname can vary in details (ex) rounded, rounded-lg, rounded-tl-md, etc.
  // The more detailed class should override the less detailed class.
  final borderRadius = onlyRoundedClasses
      .map(parseOneBorderRadius)
      .fold(_noRadius, (value, element) => {...value, ...element});

  return borderRadius;
}

Map<String, double> parseOneBorderRadius(String className) {
  final splitted =
      className.split("-").where((item) => item != "rounded").toSet();

  // check if splitted contains more than 3 classes.
  if (splitted.length > 3) {
    return _noRadius;
  }

  final cornerSet = _cornerMap.keys.toSet();
  final sizeSet = _sizeMap.keys.toSet();

  // check if splitted contains classes which is not a corner nor size.
  final validClassSet = {...cornerSet, ...sizeSet};
  if (splitted.isNotEmpty && splitted.intersection(validClassSet).isEmpty) {
    return _noRadius;
  }

  final cornerKey = cornerSet.intersection(splitted);
  final corners =
      cornerKey.isNotEmpty ? _cornerMap[cornerKey.first]! : _everyCorners;

  final sizeKey = sizeSet.intersection(splitted);
  final size = sizeKey.isNotEmpty ? _sizeMap[sizeKey.first]! : 4.0;

  return {
    for (final corner in corners) "border-radius-$corner": size,
  };
}

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
