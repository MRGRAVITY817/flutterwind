import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

class FwContainer extends StatelessWidget {
  final String? style;
  final Widget? child;

  const FwContainer({
    super.key,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (style == null) {
      return Container(
        child: child,
      );
    }

    final containerStyle = ContainerStyle.from(style!);

    return Container(
      padding: containerStyle.padding,
      margin: containerStyle.margin,
      decoration: containerStyle.decoration,
      child: child,
    );
  }
}

class ContainerStyle {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;

  ContainerStyle({
    this.padding,
    this.margin,
    this.decoration,
  });

  factory ContainerStyle.from(String style) {
    final styleMap = parseStyle(style);

    return ContainerStyle(
      padding: EdgeInsets.only(
        top: styleMap['pt'],
        right: styleMap['pr'],
        bottom: styleMap['pb'],
        left: styleMap['pl'],
      ),
      margin: EdgeInsets.only(
        top: styleMap['mt'],
        right: styleMap['mr'],
        bottom: styleMap['mb'],
        left: styleMap['ml'],
      ),
      decoration: BoxDecoration(
        color: styleMap['bg-color'],
        border: Border.all(
          color: styleMap['border-color'],
          width: 2.0,
        ),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(styleMap['roundedTL']),
        //   topRight: Radius.circular(styleMap['roundedTR']),
        //   bottomRight: Radius.circular(styleMap['roundedBR']),
        //   bottomLeft: Radius.circular(styleMap['roundedBL']),
        // ),
      ),
    );
  }
}
