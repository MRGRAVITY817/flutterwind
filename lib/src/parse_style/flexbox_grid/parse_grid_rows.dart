import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, int> parseGridRows(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: gridRowsMap,
    mapKey: "grid-rows",
  );
}

Map<String, int> gridRowsMap = {
  "grid-rows-1": 1,
  "grid-rows-2": 2,
  "grid-rows-3": 3,
  "grid-rows-4": 4,
  "grid-rows-5": 5,
  "grid-rows-6": 6,
  "grid-rows-7": 7,
  "grid-rows-8": 8,
  "grid-rows-9": 9,
  "grid-rows-10": 10,
  "grid-rows-11": 11,
  "grid-rows-12": 12,
};
