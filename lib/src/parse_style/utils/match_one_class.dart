T? matchOneClass<T>(
    {required List<String> classes, required Map<String, T?> classMap}) {
  final matchedClasses = classes.where((c) => classMap.keys.contains(c));

  if (matchedClasses.isEmpty || matchedClasses.length > 1) {
    return null;
  }

  return classMap[matchedClasses.first];
}

Map<String, T> matchOneClassMap<T>({
  required List<String> classes,
  required Map<String, T?> classMap,
  required String mapKey,
}) {
  final matched = matchOneClass(classes: classes, classMap: classMap);

  return matched != null ? {mapKey: matched} : {};
}
