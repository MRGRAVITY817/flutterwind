import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, MainAxisAlignment> parseJustifyItems(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: justifyItemsMap,
    mapKey: "justify-items",
  );
}

Map<String, MainAxisAlignment> justifyItemsMap = {
  "justify-items-start": MainAxisAlignment.start,
  "justify-items-end": MainAxisAlignment.end,
  "justify-items-center": MainAxisAlignment.center,
  // TODO: Implement stretch
};
