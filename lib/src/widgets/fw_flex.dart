import 'package:flutter/widgets.dart';
import 'package:flutterwind/flutterwind.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

class FwFlex extends StatelessWidget {
  final String? style;
  final List<Widget> children;

  const FwFlex({
    super.key,
    this.style,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final FwFlexStyle fwStyle = FwFlexStyle.from(style ?? "", context);

    return FwContainer(
      style: style,
      child: Wrap(
        direction: fwStyle.direction ?? Axis.horizontal,
        alignment: fwStyle.alignment ?? WrapAlignment.start,
        spacing: fwStyle.spacing ?? 0.0,
        runAlignment: fwStyle.runAlignment ?? WrapAlignment.start,
        runSpacing: fwStyle.runSpacing ?? 0.0,
        crossAxisAlignment:
            fwStyle.crossAxisAlignment ?? WrapCrossAlignment.start,
        textDirection: fwStyle.textDirection ?? TextDirection.ltr,
        verticalDirection: fwStyle.verticalDirection ?? VerticalDirection.down,
        clipBehavior: fwStyle.clipBehavior ?? Clip.none,
        children: fwStyle.reverse ? children.reversed.toList() : children,
      ),
    );
  }
}

class FwFlexStyle {
  final Axis? direction;
  final WrapAlignment? alignment;
  final double? spacing;
  final WrapAlignment? runAlignment;
  final double? runSpacing;
  final WrapCrossAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final Clip? clipBehavior;
  final bool reverse;

  const FwFlexStyle({
    this.direction,
    this.alignment,
    this.spacing,
    this.runAlignment,
    this.runSpacing,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.clipBehavior,
    this.reverse = false,
  });

  factory FwFlexStyle.from(String style, BuildContext context) {
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    return FwFlexStyle(
      direction: styleMap["flex-direction"],
      alignment: styleMap["justify-content"],
      crossAxisAlignment: styleMap["align-items"],
      spacing: styleMap["main-gap"],
      runSpacing: styleMap["cross-gap"],
      runAlignment: styleMap["align-content"],
      textDirection: styleMap["text-direction"],
      verticalDirection: styleMap["vertical-direction"],
      clipBehavior: styleMap["clip-behavior"],
      reverse: styleMap["flex-reverse"] ?? false,
    );
  }
}
