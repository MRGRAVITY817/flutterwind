import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

Map<String, double> parseTextDecorationThickness(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: textDecorationThicknessClassMap,
    mapKey: "text-decoration-thickness",
  );
}

const Map<String, double> textDecorationThicknessClassMap = {
  "decoration-0": 0,
  "decoration-1": 1,
  "decoration-2": 2,
  "decoration-4": 4,
  "decoration-8": 8,
};

// TODO: implement how to parse `decoration-auto` and `decoration-from-font`
