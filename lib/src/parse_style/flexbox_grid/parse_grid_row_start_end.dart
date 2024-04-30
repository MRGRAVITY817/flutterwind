Map<String, int> parseGridRowStartEnd(List<String> classes) {
  final start = classes.firstWhere(
    (e) => gridRowStartMap.containsKey(e),
    orElse: () => "",
  );

  final end = classes.firstWhere(
    (e) => gridRowEndMap.containsKey(e),
    orElse: () => "",
  );

  final span = classes.firstWhere(
    (e) => gridRowSpanMap.containsKey(e),
    orElse: () => "",
  );

  if (start.isNotEmpty && end.isNotEmpty) {
    final startValue = gridRowStartMap[start]!;
    final endValue = gridRowEndMap[end]!;

    return {
      "grid-row-start": startValue,
      "grid-row-span": endValue - startValue,
    };
  }

  if (start.isNotEmpty && end.isEmpty && span.isEmpty) {
    return {
      "grid-row-start": gridRowStartMap[start]!,
      "grid-row-span": 1,
    };
  }

  if (span.isNotEmpty) {
    final spanValue = gridRowSpanMap[span]!;

    if (start.isNotEmpty) {
      final startValue = gridRowStartMap[start]!;

      return {
        "grid-row-start": startValue,
        "grid-row-span": spanValue,
      };
    }

    if (end.isNotEmpty) {
      final endValue = gridRowEndMap[end]!;

      if (spanValue >= endValue) return {};

      return {
        "grid-row-start": endValue - spanValue,
        "grid-row-span": spanValue,
      };
    }

    return {
      "grid-row-span": spanValue,
    };
  }

  return {};
}

const Map<String, int> gridRowStartMap = {
  "row-start-1": 1,
  "row-start-2": 2,
  "row-start-3": 3,
  "row-start-4": 4,
  "row-start-5": 5,
  "row-start-6": 6,
  "row-start-7": 7,
  "row-start-8": 8,
  "row-start-9": 9,
  "row-start-10": 10,
  "row-start-11": 11,
  "row-start-12": 12,
  "row-start-13": 13,
};

const Map<String, int> gridRowEndMap = {
  "row-end-1": 1,
  "row-end-2": 2,
  "row-end-3": 3,
  "row-end-4": 4,
  "row-end-5": 5,
  "row-end-6": 6,
  "row-end-7": 7,
  "row-end-8": 8,
  "row-end-9": 9,
  "row-end-10": 10,
  "row-end-11": 11,
  "row-end-12": 12,
  "row-end-13": 13,
};

const Map<String, int> gridRowSpanMap = {
  "row-span-1": 1,
  "row-span-2": 2,
  "row-span-3": 3,
  "row-span-4": 4,
  "row-span-5": 5,
  "row-span-6": 6,
  "row-span-7": 7,
  "row-span-8": 8,
  "row-span-9": 9,
  "row-span-10": 10,
  "row-span-11": 11,
  "row-span-12": 12,
};
