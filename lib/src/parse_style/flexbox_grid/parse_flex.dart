import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, int> parseFlex(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: flexClassMap,
    mapKey: "flex",
  );
}

final flexMaxSize = 12;

const Map<String, int> flexClassMap = {
  "flex-1": 1,
  "flex-2": 2,
  "flex-3": 3,
  "flex-4": 4,
  "flex-5": 5,
  "flex-6": 6,
  "flex-7": 7,
  "flex-8": 8,
  "flex-9": 9,
  "flex-10": 10,
  "flex-11": 11,
  "flex-12": 12,
};
