import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, String> parseJustifyItems(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: justifyItemsMap,
    mapKey: "justify-items",
  );
}

Map<String, String> justifyItemsMap = {
  "justify-items-start": "start",
  "justify-items-end": "end",
  "justify-items-center": "center",
  "justify-items-stretch": "stretch",
};
