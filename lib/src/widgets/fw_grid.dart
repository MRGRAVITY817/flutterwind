import 'package:flutter/widgets.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutterwind/flutterwind.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

class FwGrid extends StatelessWidget {
  final String? style;
  final List<Widget> children;

  const FwGrid({
    super.key,
    this.style,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final fwStyle = FwGridStyle.from(style ?? "", context);

    // Get parent grid's column count
    final LayoutGrid? parentGrid =
        context.findAncestorWidgetOfExactType<LayoutGrid>();

    // If parent grid is found, use its column count
    final int columns = fwStyle.isSubgrid
        ? (parentGrid?.columnSizes.length ?? 1)
        : fwStyle.columns ?? 1;

    int rowCount(List<Widget> children, int columns) {
      return (children.length / columns).ceil();
    }

    return FwContainer(
      style: style,
      child: LayoutGrid(
        gridFit: GridFit.expand,
        autoPlacement: fwStyle.autoPlacement ?? AutoPlacement.rowSparse,
        textDirection: TextDirection.ltr,
        columnSizes: List.generate(
          columns,
          (index) => 1.fr,
        ),
        rowSizes: List.generate(
          fwStyle.rows ?? rowCount(children, columns),
          (index) => auto,
        ),
        children: children,
      ),
    );
  }
}

class FwGridStyle {
  final int? columns;
  final int? rows;
  final double? spacing;
  final double? runSpacing;
  final CrossAxisAlignment? alignSelf;
  final bool isSubgrid;
  final AutoPlacement? autoPlacement;

  const FwGridStyle({
    this.columns,
    this.rows,
    this.spacing,
    this.runSpacing,
    this.alignSelf,
    this.isSubgrid = false,
    this.autoPlacement,
  });

  factory FwGridStyle.from(String style, BuildContext context) {
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    return FwGridStyle(
      columns: styleMap["grid-cols"],
      rows: styleMap["grid-rows"],
      spacing: styleMap["gap"],
      runSpacing: styleMap["row-gap"],
      alignSelf: styleMap["align-self"],
      isSubgrid: styleMap["subgrid"] ?? false,
      autoPlacement: styleMap["grid-auto-flow"],
    );
  }
}
