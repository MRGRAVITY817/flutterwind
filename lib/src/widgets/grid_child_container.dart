import 'package:flutter/widgets.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutterwind/src/widgets/fw_container.dart';

Widget gridChildContainer(
  FwContainerStyle containerStyle,
  Container child,
) {
  if (containerStyle.columnStart == null &&
      containerStyle.columnSpan == null &&
      containerStyle.rowStart == null &&
      containerStyle.rowSpan == null) {
    return child;
  }

  return child.withGridPlacement(
    columnStart: containerStyle.columnStart != null
        ? containerStyle.columnStart! - 1
        : null,
    columnSpan: containerStyle.columnSpan ?? 1,
    rowStart:
        containerStyle.rowStart != null ? containerStyle.rowStart! - 1 : null,
    rowSpan: containerStyle.rowSpan ?? 1,
  );
}
