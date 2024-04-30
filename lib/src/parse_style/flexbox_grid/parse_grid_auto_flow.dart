import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutterwind/src/parse_style/utils/match_one_class.dart';

/// Parses the grid-auto-flow classes
///
/// The following classes are supported:
///   - grid-flow-col
///   - grid-flow-row
///   - grid-flow-dense
///   - grid-flow-col-dense
///   - grid-flow-row-dense
///
/// Example:
/// ```dart
/// final classes = ["grid-flow-col"];
/// final output = parseGridAutoFlow(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// {
///   "grid-auto-flow": AutoPlacement.columnSparse,
/// }
/// ```
Map<String, AutoPlacement> parseGridAutoFlow(List<String> classes) {
  return matchOneClassMap(
    classes: classes,
    classMap: gridAutoFlowMap,
    mapKey: "grid-auto-flow",
  );
}

Map<String, AutoPlacement> gridAutoFlowMap = {
  "grid-flow-col": AutoPlacement.columnSparse,
  "grid-flow-row": AutoPlacement.rowSparse,
  "grid-flow-dense": AutoPlacement.columnDense,
  "grid-flow-col-dense": AutoPlacement.columnDense,
  "grid-flow-row-dense": AutoPlacement.rowDense,
};
