import 'package:flutter/material.dart';
import 'package:flutterwind/src/parse_style/parse_style.dart';

class FwText extends StatelessWidget {
  final String? style;
  final String text;

  const FwText({
    super.key,
    this.style,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    if (style == null) {
      return Text(text);
    }

    final fwStyle = FwTextStyle.from(context, style!);

    return Text(
      text,
      textAlign: fwStyle.textAlign,
      style: fwStyle.textStyle,
    );
  }
}

class FwTextStyle {
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const FwTextStyle({
    this.textStyle,
    this.textAlign,
  });

  factory FwTextStyle.from(BuildContext context, String style) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final styleMap = parseStyle(style, MediaQuery.sizeOf(context));

    print("styleMap: $styleMap");

    return FwTextStyle(
      textStyle: TextStyle(
        color: isDark
            ? (styleMap["dark:text-color"] ?? styleMap["text-color"])
            : styleMap["text-color"],
        fontSize: styleMap["font-size"],
        fontWeight: styleMap["font-weight"],
      ),
      textAlign: styleMap["text-align"],
    );
  }
}
