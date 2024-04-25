/// A convenience function to join a list of CSS classes into a single string.
///
/// Example:
/// ```dart
/// final classes = ["text-red-500 font-bold", "text-center"];
/// final output = styles(classes);
///
/// print(output);
/// ```
///
/// Output:
/// ```
/// text-red-500 font-bold text-center
/// ```
String styles(List<String> classes) {
  return classes.join(" ");
}
