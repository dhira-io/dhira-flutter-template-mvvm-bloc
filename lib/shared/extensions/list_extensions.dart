/// Extension methods for [List] to simplify access and manipulation.
extension ListX<T> on List<T> {
  /// Returns the first element if not empty, otherwise null.
  ///
  /// Example:
  /// ```dart
  /// var first = list.firstOrNull;
  /// ```
  T? get firstOrNull => isEmpty ? null : first;

  /// Returns the last element if not empty, otherwise null.
  ///
  /// Example:
  /// ```dart
  /// var last = list.lastOrNull;
  /// ```
  T? get lastOrNull => isEmpty ? null : last;

  /// Returns the second element if the list has at least two elements, otherwise null.
  ///
  /// Example:
  /// ```dart
  /// var second = list.secondOrNull;
  /// ```
  T? get secondOrNull => length < 2 ? null : this[1];

  /// Chunks the list into smaller sub-lists of a given [size].
  ///
  /// Example:
  /// ```dart
  /// var chunks = [1, 2, 3, 4].chunk(2); // [[1, 2], [3, 4]]
  /// ```
  List<List<T>> chunk(int size) {
    if (size <= 0) return [this];
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Returns a new list with duplicates removed.
  ///
  /// Example:
  /// ```dart
  /// var unique = [1, 1, 2].removeDuplicates(); // [1, 2]
  /// ```
  List<T> removeDuplicates() {
    return toSet().toList();
  }

  /// Adds the [element] if it's not in the list, otherwise removes it.
  ///
  /// Example:
  /// ```dart
  /// list.toggle(5);
  /// ```
  void toggle(T element) {
    if (contains(element)) {
      remove(element);
    } else {
      add(element);
    }
  }
}
