/// Parse border width classes
///
/// Example:
/// ```dart
/// final classes = ["border", "border-t-2"];
/// final output = parseBorderWidth(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "border-top-width": 2.0,
///   "border-right-width": 1.0,
///   "border-bottom-width": 1.0,
///   "border-left-width": 1.0,
/// }
Map<String, double> parseBorderWidth(List<String> classes) {
  final borderWidthClasses =
      classes.where((element) => element.startsWith('border')).toList();

  if (borderWidthClasses.isEmpty) {
    return _zeroBorder;
  }

  final borderWidth = borderWidthClasses
      .map(parseOneBorderWidth)
      .fold(_zeroBorder, (value, element) => {...value, ...element});

  return borderWidth;
}

Map<String, double> parseOneBorderWidth(String className) {
  final splitted =
      className.split("-").where((item) => item != "border").toSet();

  if (splitted.length > 3) {
    return _zeroBorder;
  }

  final sideSet = _sideMap.keys.toSet();
  final sizeSet = _sizeMap.keys.toSet();

  final validClassSet = {...sideSet, ...sizeSet};
  if (splitted.isNotEmpty && splitted.intersection(validClassSet).isEmpty) {
    return {};
  }

  final sideKey = sideSet.intersection(splitted);
  final sides = sideKey.isNotEmpty
      ? _sideMap[sideKey.first]!
      : ['top', 'right', 'bottom', 'left'];

  final sizeKey = sizeSet.intersection(splitted);
  final size = sizeKey.isNotEmpty ? _sizeMap[sizeKey.first]! : 1.0;

  return {
    for (final side in sides) "border-$side-width": size,
  };
}

const Map<String, double> _zeroBorder = {
  'border-top-width': 0.0,
  'border-bottom-width': 0.0,
  'border-left-width': 0.0,
  'border-right-width': 0.0,
};

const Map<String, List<String>> _sideMap = {
  't': ['top'],
  'r': ['right'],
  'b': ['bottom'],
  'l': ['left'],
  'x': ['left', 'right'],
  'y': ['top', 'bottom'],
};

const Map<String, double> _sizeMap = {
  "0": 0.0,
  "2": 2.0,
  "4": 4.0,
  "8": 8.0,
};
