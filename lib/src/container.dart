import 'package:flutter/widgets.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

Container FwContainer({
  String? style,
  required Widget child,
}) {
  if (style == null) {
    return Container(child: child);
  }

  final parsedStyle = ContainerStyle.from(style);

  return Container(
    padding: parsedStyle.padding,
    margin: parsedStyle.margin,
    decoration: parsedStyle.decoration,
    child: child,
  );
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
        color: styleMap['bgColor'],
      ),
    );
  }
}
