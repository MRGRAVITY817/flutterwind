import 'package:flutter/material.dart';
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

    final containerStyle = FwContainerStyle.from(context, style!);

    if (containerStyle.alignSelf != null) {
      final Flex? parentFlex = context.findAncestorWidgetOfExactType<Flex>();
      if (parentFlex != null) {
        return Flex(
          direction: parentFlex.direction,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: containerStyle.alignSelf!,
          children: [
            Container(
              height: containerStyle.height,
              width: containerStyle.width,
              padding: containerStyle.padding,
              margin: containerStyle.margin,
              decoration: containerStyle.decoration,
              child: child,
            )
          ],
        );
      }
    }

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

class FwContainerStyle {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final CrossAxisAlignment? alignSelf;

  FwContainerStyle({
    this.padding,
    this.margin,
    this.decoration,
    this.height,
    this.width,
    this.alignSelf,
  });

  factory FwContainerStyle.from(BuildContext context, String style) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);
    final styleMap = parseStyle(style, size);
    final borderColor = (isDark
            ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
            : styleMap['border-color']) ??
        Colors.transparent;

    return FwContainerStyle(
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
            color: borderColor,
            width: styleMap['border-top-width'],
          ),
          bottom: BorderSide(
            color: borderColor,
            width: styleMap['border-bottom-width'],
          ),
          left: BorderSide(
            color: borderColor,
            width: styleMap['border-left-width'],
          ),
          right: BorderSide(
            color: borderColor,
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
      alignSelf: styleMap['align-self'],
    );
  }
}
