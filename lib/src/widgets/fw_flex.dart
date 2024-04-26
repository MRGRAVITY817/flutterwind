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
    final reversedChildren =
        fwStyle.reverse ? children.reversed.toList() : children;

    return FwContainer(
      style: style,
      child: Flex(
        direction: fwStyle.direction ?? Axis.horizontal,
        mainAxisAlignment: fwStyle.mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment:
            fwStyle.crossAxisAlignment ?? CrossAxisAlignment.start,
        textDirection: fwStyle.textDirection ?? TextDirection.ltr,
        verticalDirection: fwStyle.verticalDirection ?? VerticalDirection.down,
        clipBehavior: fwStyle.clipBehavior ?? Clip.none,
        children: reversedChildren,
      ),
    );
  }
}

class FwFlexStyle {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? spacing;
  final WrapAlignment? runAlignment;
  final double? runSpacing;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final Clip? clipBehavior;
  final bool reverse;

  const FwFlexStyle({
    this.direction,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.spacing,
    this.runAlignment,
    this.runSpacing,
    this.textDirection,
    this.verticalDirection,
    this.clipBehavior,
    this.reverse = false,
  });

  factory FwFlexStyle.from(String style, BuildContext context) {
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    return FwFlexStyle(
      direction: styleMap["flex-direction"],
      mainAxisAlignment: styleMap["justify-content"],
      crossAxisAlignment: styleMap["align-items"],
      spacing: styleMap["main-gap"],
      runSpacing: styleMap["cross-gap"],
      runAlignment: styleMap["align-content"],
      textDirection: styleMap["text-direction"],
      verticalDirection: styleMap["vertical-direction"],
      clipBehavior: styleMap["clip-behavior"],
      reverse: styleMap["reverse"] ?? false,
    );
  }
}
