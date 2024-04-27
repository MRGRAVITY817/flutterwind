import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, bool> parseGridColsSubgrid(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: gridColsSubgridMap,
    mapKey: "subgrid",
  );
}

Map<String, bool> gridColsSubgridMap = {
  "grid-cols-subgrid": true,
};
