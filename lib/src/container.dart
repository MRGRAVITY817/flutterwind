import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

    final containerStyle = ContainerStyle.from(context, style!);

    return Container(
      height: containerStyle.height,
      width: containerStyle.width,
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
  final double? height;
  final double? width;

  ContainerStyle({
    this.padding,
    this.margin,
    this.decoration,
    this.height,
    this.width,
  });

  factory ContainerStyle.from(BuildContext context, String style) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final styleMap = parseStyle(style);

    return ContainerStyle(
      height: styleMap['h'],
      width: styleMap['w'],
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
        color: isDark
            ? (styleMap['dark:bg-color'] ?? styleMap['bg-color'])
            : styleMap['bg-color'],
        border: Border(
          top: BorderSide(
            color: isDark
                ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
                : styleMap['border-color'],
            width: styleMap['border-top-width'],
          ),
          bottom: BorderSide(
            color: isDark
                ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
                : styleMap['border-color'],
            width: styleMap['border-bottom-width'],
          ),
          left: BorderSide(
            color: isDark
                ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
                : styleMap['border-color'],
            width: styleMap['border-left-width'],
          ),
          right: BorderSide(
            color: isDark
                ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
                : styleMap['border-color'],
            width: styleMap['border-right-width'],
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(styleMap['border-radius-tl']),
          topRight: Radius.circular(styleMap['border-radius-tr']),
          bottomRight: Radius.circular(styleMap['border-radius-br']),
          bottomLeft: Radius.circular(styleMap['border-radius-bl']),
        ),
      ),
    );
  }
}
