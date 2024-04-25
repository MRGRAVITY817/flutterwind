import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/value_from_classes.dart';

/// Parse height and width classes.
///
/// Example:
/// ```dart
/// final classes = ["h-12", "w-24"];
/// final output = parseHeightWidth(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "h": 12.0,
///   "w": 24.0,
/// }
/// ```
Map<String, double?> parseHeightWidth(List<String> classes, Size size) {
  return {
    "h": parseDimension(
      className: valueFromClasses(classes, "h-") ?? "",
      isHeight: true,
      size: size,
    ),
    "w": parseDimension(
      className: valueFromClasses(classes, "w-") ?? "",
      isHeight: false,
      size: size,
    )
  };
}

/// Parse size classes.
/// Size class is used to set both height and width with the same value.
///
/// Example:
/// ```dart
/// final classes = ["size-12"];
/// final output = parseSize(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "h": 12.0,
///   "w": 12.0,
/// }
/// ```
Map<String, double?> parseSize(List<String> classes) {
  // if there's multiple `size-` classes, it will 0.0
  if (classes.where((className) => className.startsWith("size-")).length > 1) {
    return {"h": 0.0, "w": 0.0};
  }

  final size = parseDimension(
    className: valueFromClasses(classes, "size-") ?? "",
    isHeight: true,
    size: Size.zero,
  );

  return {"h": size, "w": size};
}

double? parseDimension({
  required String className,
  required bool isHeight,
  required Size size,
}) {
  final heightFromSize = heightWidthSizeMap[className];

  if (heightFromSize != null) {
    return heightFromSize;
  }

  final heightFromFractionalSize = heightWidthFractionalSizeMap[className];

  if (heightFromFractionalSize != null) {
    return heightFromFractionalSize * (isHeight ? size.height : size.width);
  }

  return null;
}

const Map<String, double> heightWidthSizeMap = {
  "0": 0.0,
  "px": 1.0,
  "0.5": 2.0,
  "1": 4.0,
  "1.5": 6.0,
  "2": 8.0,
  "2.5": 10.0,
  "3": 12.0,
  "3.5": 14.0,
  "4": 16.0,
  "5": 20.0,
  "6": 24.0,
  "7": 28.0,
  "8": 32.0,
  "9": 36.0,
  "10": 40.0,
  "11": 44.0,
  "12": 48.0,
  "14": 56.0,
  "16": 64.0,
  "20": 80.0,
  "24": 96.0,
  "28": 112.0,
  "32": 128.0,
  "36": 144.0,
  "40": 160.0,
  "44": 176.0,
  "48": 192.0,
  "52": 208.0,
  "56": 224.0,
  "60": 240.0,
  "64": 256.0,
  "72": 288.0,
  "80": 320.0,
  "96": 384.0,
};

const Map<String, double> heightWidthFractionalSizeMap = {
// "auto": double.infinity,
  "1/2": 0.5,
  "1/3": 0.333333,
  "2/3": 0.666667,
  "1/4": 0.25,
  "2/4": 0.5,
  "3/4": 0.75,
  "1/5": 0.2,
  "2/5": 0.4,
  "3/5": 0.6,
  "4/5": 0.8,
  "1/6": 0.166667,
  "2/6": 0.333333,
  "3/6": 0.5,
  "4/6": 0.666667,
  "5/6": 0.833333,
  "1/12": 0.0833333,
  "2/12": 0.166667,
  "3/12": 0.25,
  "4/12": 0.333333,
  "5/12": 0.416667,
  "6/12": 0.5,
  "7/12": 0.583333,
  "8/12": 0.666667,
  "9/12": 0.75,
  "10/12": 0.833333,
  "11/12": 0.916667,
  "full": 1.0,
};

// const Map<String, double> heightWidthFitContentMap =  {
// screen	width: 100vw;
// svw	width: 100svw;
// lvw	width: 100lvw;
// dvw	width: 100dvw;
// min	width: min-content;
// max	width: max-content;
// fit	width: fit-content;
// };

