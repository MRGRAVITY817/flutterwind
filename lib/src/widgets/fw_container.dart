import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutterwind/flutterwind.dart';
import 'package:flutterwind/src/parse_style/flexbox_grid/parse_justify_items.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';
import 'package:flutterwind/src/widgets/fw_grid.dart';
import 'package:flutterwind/src/widgets/grid_child_container.dart';

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

    final styledChild = Container(
      height: containerStyle.height,
      width: containerStyle.width,
      padding: containerStyle.padding,
      margin: containerStyle.margin,
      decoration: containerStyle.decoration,
      child: child,
    );

    if (containerStyle.alignSelf != null) {
      final Flex? parentFlex = context.findAncestorWidgetOfExactType<Flex>();
      if (parentFlex != null) {
        return Flex(
          direction: parentFlex.direction,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: containerStyle.alignSelf!,
          children: [styledChild],
        );
      }
    }

    final gridParent = context.findAncestorWidgetOfExactType<FwGrid>();

    if (gridParent == null || child is LayoutGrid) {
      return styledChild;
    }

    final gridChild = gridChildContainer(containerStyle, styledChild);

    // If grid parent has a justify-items style, we should wrap the child
    // in a Row with mainAxisAlignment equal to the justify-items value
    final gridParentStyle = gridParent.style;

    if (gridParentStyle != null) {
      final justifyItems = parseJustifyItems(gridParentStyle.split(" "));
      if (justifyItems.isNotEmpty) {
        return Row(
          mainAxisAlignment:
              justifyItems["justify-items"] ?? MainAxisAlignment.start,
          children: [
            Container(
              height: containerStyle.height,
              width: containerStyle.width,
              padding: containerStyle.padding,
              margin: containerStyle.margin,
              decoration: containerStyle.decoration,
              child: child,
            ),
          ],
        ).withGridPlacement(
          columnStart: containerStyle.columnStart != null
              ? containerStyle.columnStart! - 1
              : null,
          columnSpan: containerStyle.columnSpan ?? 1,
          rowStart: containerStyle.rowStart != null
              ? containerStyle.rowStart! - 1
              : null,
          rowSpan: containerStyle.rowSpan ?? 1,
        );
      }
    }

    return gridChild;
  }
}

class FwContainerStyle {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final CrossAxisAlignment? alignSelf;
  final int? columnStart;
  final int? columnSpan;
  final int? rowStart;
  final int? rowSpan;

  FwContainerStyle({
    this.padding,
    this.margin,
    this.decoration,
    this.height,
    this.width,
    this.alignSelf,
    this.columnStart,
    this.columnSpan,
    this.rowStart,
    this.rowSpan,
  });

  factory FwContainerStyle.from(BuildContext context, String style) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);
    final styleMap = parseStyle(style, size);
    final borderColor = (isDark
            ? (styleMap['dark:border-color'] ?? styleMap['border-color'])
            : styleMap['border-color']) ??
        Colors.transparent;
    final hasPadding = styleMap.containsKey('pt') ||
        styleMap.containsKey('pr') ||
        styleMap.containsKey('pb') ||
        styleMap.containsKey('pl');
    final hasMargin = styleMap.containsKey('mt') ||
        styleMap.containsKey('mr') ||
        styleMap.containsKey('mb') ||
        styleMap.containsKey('ml');

    return FwContainerStyle(
      height: styleMap['h'],
      width: styleMap['w'],
      padding: hasPadding
          ? EdgeInsets.only(
              top: styleMap['pt'],
              right: styleMap['pr'],
              bottom: styleMap['pb'],
              left: styleMap['pl'],
            )
          : null,
      margin: hasMargin
          ? EdgeInsets.only(
              top: styleMap['mt'],
              right: styleMap['mr'],
              bottom: styleMap['mb'],
              left: styleMap['ml'],
            )
          : null,
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
          topLeft: Radius.circular(styleMap['rounded-tl']),
          topRight: Radius.circular(styleMap['rounded-tr']),
          bottomRight: Radius.circular(styleMap['rounded-br']),
          bottomLeft: Radius.circular(styleMap['rounded-bl']),
        ),
      ),
      alignSelf: styleMap['align-self'],
      columnStart: styleMap['grid-column-start'],
      columnSpan: styleMap['grid-column-span'],
      rowStart: styleMap['grid-row-start'],
      rowSpan: styleMap['grid-row-span'],
    );
  }
}
