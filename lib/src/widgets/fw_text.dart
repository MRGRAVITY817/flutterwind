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

    final textColor = (isDark
            ? (styleMap["dark:text-color"] ?? styleMap["text-color"])
            : styleMap["text-color"]) ??
        Colors.black;

    // Underline offset
    final double underlineOffset = styleMap["text-underline-offset"] ?? 0;
    final useUnderlineOffset =
        styleMap["text-decoration"] == TextDecoration.underline &&
            styleMap["text-underline-offset"] != null;

    // Letter spacing
    final double? letterSpacing = styleMap["letter-spacing"] != null
        ? styleMap["letter-spacing"] * (styleMap["font-size"] ?? 16)
        : null;

    return FwTextStyle(
      textStyle: TextStyle(
        color: useUnderlineOffset ? Colors.transparent : textColor,
        fontSize: styleMap["font-size"],
        fontWeight: styleMap["font-weight"],
        fontStyle: styleMap["font-style"],
        fontFeatures: [...styleMap["font-features-numeric"] ?? []],
        decoration: styleMap["text-decoration"],
        decorationColor: styleMap["decoration-color"],
        decorationStyle: styleMap["text-decoration-style"],
        decorationThickness: styleMap["text-decoration-thickness"],
        letterSpacing: letterSpacing,
        shadows: useUnderlineOffset
            ? [
                Shadow(
                  color: textColor,
                  offset: Offset(0, -underlineOffset),
                ),
              ]
            : null,
      ),
      textAlign: styleMap["text-align"],
    );
  }
}
