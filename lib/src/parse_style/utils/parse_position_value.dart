Map<String, dynamic> parsePositionValue({
  required String className,
  required String prefix,
  required Map<String, List<String>> positionMap,
  required List<String> positionList,
  required Map<String, dynamic> valueMap,
  required dynamic defaultValue,
}) {
  final splitted = className.split("-").where((item) => item != prefix).toSet();

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

  return {
    for (final position in positions) "$prefix-$position": value,
  };
}
