import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, CrossAxisAlignment> parseAlignSelf(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: alignSelfMap,
    mapKey: "align-self",
  );
}

Map<String, CrossAxisAlignment> alignSelfMap = {
  "self-start": CrossAxisAlignment.start,
  "self-end": CrossAxisAlignment.end,
  "self-center": CrossAxisAlignment.center,
  "self-stretch": CrossAxisAlignment.stretch,
  "self-baseline": CrossAxisAlignment.baseline,
};
