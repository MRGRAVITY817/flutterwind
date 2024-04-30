import 'package:flutter/material.dart';

Map<String, List<FontFeature>> parseFontVariantNumeric(List<String> classes) {
  final onlyNumericClasses =
      classes.where((e) => fontFeatureMap.keys.any(e.startsWith)).toList();

  if (onlyNumericClasses.isEmpty) {
    return {};
  }

  return {
    "font-features-numeric": onlyNumericClasses
        .map((e) => fontFeatureMap[e])
        .where((element) => element != null)
        .map((e) => e!)
        .toList(),
  };
}

Map<String, FontFeature?> fontFeatureMap = {
  "normal-nums": null,
  "ordinal": FontFeature.ordinalForms(),
  "slashed-zero": FontFeature.slashedZero(),
  "lining-nums": FontFeature.liningFigures(),
  "oldstyle-nums": FontFeature.oldstyleFigures(),
  "proportional-nums": FontFeature.proportionalFigures(),
  "tabular-nums": FontFeature.tabularFigures(),
  "diagonal-fractions": FontFeature.fractions(),
  "stacked-fractions": FontFeature.alternativeFractions(),
};
