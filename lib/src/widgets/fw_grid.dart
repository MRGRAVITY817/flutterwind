import 'package:flutter/widgets.dart';
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

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: fwStyle.columns ?? 1,
        crossAxisSpacing: fwStyle.spacing ?? 0,
        mainAxisSpacing: fwStyle.runSpacing ?? 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
    );
  }
}

class FwGridStyle {
  final int? columns;
  final double? spacing;
  final double? runSpacing;
  final CrossAxisAlignment? alignSelf;

  const FwGridStyle({
    this.columns,
    this.spacing,
    this.runSpacing,
    this.alignSelf,
  });

  factory FwGridStyle.from(String style, BuildContext context) {
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    return FwGridStyle(
      columns: styleMap["grid-cols"],
      spacing: styleMap["gap"],
      runSpacing: styleMap["row-gap"],
      alignSelf: styleMap["align-self"],
    );
  }
}
