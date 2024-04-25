import 'package:flutter/widgets.dart';
import 'package:flutterwind/flutterwind.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

class FwFlexible extends StatelessWidget {
  final String? style;
  final Widget child;

  const FwFlexible({
    super.key,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final fwStyle = FwFlexibleStyle.from(style ?? "", context);
    final int flex = fwStyle.flex ?? 1;

    return Flexible(
      flex: flex,
      child: FwContainer(
        style: style,
        child: child,
      ),
    );
  }
}

class FwFlexibleStyle {
  final int? flex;

  const FwFlexibleStyle({
    this.flex,
  });

  factory FwFlexibleStyle.from(String style, BuildContext context) {
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    return FwFlexibleStyle(
      flex: styleMap["flex"],
    );
  }
}
