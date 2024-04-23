String? valueFromClasses(List<String> input, String prefix) {
  final classWithPrefix = input.firstWhere(
    (element) => element.startsWith(prefix),
    orElse: () => "",
  );

  if (classWithPrefix.isEmpty) {
    return null;
  }

  return classWithPrefix.substring(prefix.length);
}
