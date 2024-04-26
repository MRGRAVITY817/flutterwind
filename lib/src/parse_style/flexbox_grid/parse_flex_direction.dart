import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parse flex direction classes.
///
/// Example:
/// ```dart
/// final classes = ["flex-row"];
/// final output = parseFlexDirection(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "flex-direction": Axis.horizontal,
///   "reverse": false,
/// }
/// ```
Map<String, dynamic> parseFlexDirection(List<String> classes) {
  final className = matchOneClass(
    classes: classes,
    classMap: flexDirectionMap,
  );

  return className ?? {};
}

Map<String, Map<String, dynamic>> flexDirectionMap = {
  "flex-row": {"flex-direction": Axis.horizontal, "reverse": false},
  "flex-row-reverse": {"flex-direction": Axis.horizontal, "reverse": true},
  "flex-col": {"flex-direction": Axis.vertical, "reverse": false},
  "flex-col-reverse": {"flex-direction": Axis.vertical, "reverse": true},
};
