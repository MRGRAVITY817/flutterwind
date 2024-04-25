import 'dart:ui';

import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse font style classes
Map<String, FontStyle> parseFontStyle(List<String> classes) {
  final fontStyle = matchOneClass(
    classes: classes,
    classMap: fontStyleClassMap,
  );

  return fontStyle != null ? {"font-style": fontStyle} : {};
}

const Map<String, FontStyle> fontStyleClassMap = {
  "italic": FontStyle.italic,
  "not-italic": FontStyle.normal,
};
