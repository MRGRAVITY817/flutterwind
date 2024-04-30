Map<String, dynamic> parsePositionValue({
  required String className,
  required String prefix,
  required Map<String, List<String>> positionMap,
  required List<String> positionList,
  required Map<String, dynamic> valueMap,
  required dynamic defaultValue,
  bool separatePrefixAndPosition = false,
}) {
  final initialClassName = separatePrefixAndPosition
      ? separatePrefix(
          className: className,
          prefix: prefix,
        )
      : className;

  final splitted =
      initialClassName.split("-").where((item) => item != prefix).toSet();

  if (splitted.length > 3) {
    return {};
  }

  final positionSet = positionMap.keys.toSet();
  final valueSet = valueMap.keys.toSet();

  final validClassSet = {...positionSet, ...valueSet};
  if (splitted.isNotEmpty && splitted.intersection(validClassSet).isEmpty) {
    return {};
  }

  final positionKey = positionSet.intersection(splitted);
  final positions =
      positionKey.isNotEmpty ? positionMap[positionKey.first]! : positionList;

  final valueKey = valueSet.intersection(splitted);
  final value = valueKey.isNotEmpty ? valueMap[valueKey.first]! : defaultValue;

  String mapKey(String position) {
    return separatePrefixAndPosition ? "$prefix$position" : "$prefix-$position";
  }

  return {
    for (final position in positions) mapKey(position): value,
  };
}

/// "pt-4" -> "p-t-4
String separatePrefix({
  required String className,
  required String prefix,
}) {
  if (className.startsWith("$prefix-")) {
    return className;
  }

  return "$prefix-${className.replaceFirst(prefix, "")}";
}
