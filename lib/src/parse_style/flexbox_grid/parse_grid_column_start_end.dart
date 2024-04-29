Map<String, int> parseGridColumnStartEnd(List<String> classes) {
  final start = classes.firstWhere(
    (e) => gridColStartMap.containsKey(e),
    orElse: () => "",
  );

  final end = classes.firstWhere(
    (e) => gridColEndMap.containsKey(e),
    orElse: () => "",
  );

  final span = classes.firstWhere(
    (e) => gridColSpanMap.containsKey(e),
    orElse: () => "",
  );

  if (start.isNotEmpty && end.isNotEmpty) {
    final startValue = gridColStartMap[start]!;
    final endValue = gridColEndMap[end]!;

    return {
      "grid-column-start": startValue,
      "grid-column-span": endValue - startValue,
    };
  }

  if (start.isNotEmpty && end.isEmpty && span.isEmpty) {
    return {
      "grid-column-start": gridColStartMap[start]!,
      "grid-column-span": 1,
    };
  }

  if (span.isNotEmpty) {
    final spanValue = gridColSpanMap[span]!;

    if (start.isNotEmpty) {
      final startValue = gridColStartMap[start]!;

      return {
        "grid-column-start": startValue,
        "grid-column-span": spanValue,
      };
    }

    if (end.isNotEmpty) {
      final endValue = gridColEndMap[end]!;

      if (spanValue >= endValue) return {};

      return {
        "grid-column-start": endValue - spanValue,
        "grid-column-span": spanValue,
      };
    }

    return {
      "grid-column-span": spanValue,
    };
  }

  return {};
}

const Map<String, int> gridColStartMap = {
  "col-start-1": 1,
  "col-start-2": 2,
  "col-start-3": 3,
  "col-start-4": 4,
  "col-start-5": 5,
  "col-start-6": 6,
  "col-start-7": 7,
  "col-start-8": 8,
  "col-start-9": 9,
  "col-start-10": 10,
  "col-start-11": 11,
  "col-start-12": 12,
  "col-start-13": 13,
};

const Map<String, int> gridColEndMap = {
  "col-end-1": 1,
  "col-end-2": 2,
  "col-end-3": 3,
  "col-end-4": 4,
  "col-end-5": 5,
  "col-end-6": 6,
  "col-end-7": 7,
  "col-end-8": 8,
  "col-end-9": 9,
  "col-end-10": 10,
  "col-end-11": 11,
  "col-end-12": 12,
  "col-end-13": 13,
};

const Map<String, int> gridColSpanMap = {
  "col-span-1": 1,
  "col-span-2": 2,
  "col-span-3": 3,
  "col-span-4": 4,
  "col-span-5": 5,
  "col-span-6": 6,
  "col-span-7": 7,
  "col-span-8": 8,
  "col-span-9": 9,
  "col-span-10": 10,
  "col-span-11": 11,
  "col-span-12": 12,
};
