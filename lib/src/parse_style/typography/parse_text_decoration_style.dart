import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, TextDecorationStyle> parseTextDecorationStyle(
    List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textDecorationStyleMap,
    mapKey: "text-decoration-style",
  );
}

const Map<String, TextDecorationStyle> textDecorationStyleMap = {
  "decoration-solid": TextDecorationStyle.solid,
  "decoration-double": TextDecorationStyle.double,
  "decoration-dotted": TextDecorationStyle.dotted,
  "decoration-dashed": TextDecorationStyle.dashed,
  "decoration-wavy": TextDecorationStyle.wavy,
};
