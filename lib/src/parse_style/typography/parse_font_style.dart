import 'dart:ui';

/// Parse font style classes
Map<String, FontStyle> parseFontStyle(List<String> classes) {
  final matchedClasses =
      classes.where((c) => fontStyleClassMap.keys.contains(c));

  if (matchedClasses.isEmpty || matchedClasses.length > 1) {
    return {};
  }

  return {
    "font-style": fontStyleClassMap[matchedClasses.first]!,
  };
}

const Map<String, FontStyle> fontStyleClassMap = {
  "italic": FontStyle.italic,
  "not-italic": FontStyle.normal,
};
