/// Parse font size classes
///
/// Example:
/// ```dart
/// final classes = ["text-2xl"];
/// final output = parseFontSize(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "font-size": 24.0,
///   "line-height": 32.0,
/// }
/// ```
Map<String, double> parseFontSize(List<String> classes) {
  final fontSizes = fontSizeMap.keys.toList();
  final fontSizeClasses =
      classes.where((element) => fontSizes.contains(element));

  if (fontSizeClasses.isEmpty || fontSizeClasses.length > 1) {
    return {};
  }

  final fontSize = fontSizeMap[fontSizeClasses.first];
  final lineHeight = lineHeightMap[fontSizeClasses.first];

  return {
    ...fontSize != null ? {"font-size": fontSize} : {},
    ...lineHeight != null ? {"line-height": lineHeight} : {},
  };
}

const Map<String, double> fontSizeMap = {
  "text-xs": 12.0,
  "text-sm": 14.0,
  "text-base": 16.0,
  "text-lg": 18.0,
  "text-xl": 20.0,
  "text-2xl": 24.0,
  "text-3xl": 30.0,
  "text-4xl": 36.0,
  "text-5xl": 48.0,
  "text-6xl": 60.0,
  "text-7xl": 72.0,
  "text-8xl": 96.0,
  "text-9xl": 128.0,
};

const Map<String, double?> lineHeightMap = {
  "text-xs": 16.0,
  "text-sm": 20.0,
  "text-base": 24.0,
  "text-lg": 28.0,
  "text-xl": 28.0,
  "text-2xl": 32.0,
  "text-3xl": 36.0,
  "text-4xl": 40.0,
  "text-5xl": null,
  "text-6xl": null,
  "text-7xl": null,
  "text-8xl": null,
  "text-9xl": null,
};
