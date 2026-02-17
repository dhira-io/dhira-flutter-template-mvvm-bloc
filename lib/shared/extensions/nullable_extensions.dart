/// Extension methods for nullable types to simplify null safety checks.
extension NullableX<T> on T? {
  /// Returns true if the object is null.
  ///
  /// Example:
  /// ```dart
  /// bool nullValue = someObj.isNull;
  /// ```
  bool get isNull => this == null;

  /// Returns true if the object is not null.
  ///
  /// Example:
  /// ```dart
  /// bool notNullValue = someObj.isNotNull;
  /// ```
  bool get isNotNull => this != null;

  /// Returns the object if not null, otherwise returns the [defaultValue].
  ///
  /// Example:
  /// ```dart
  /// String value = nullString.orDefault("fallback");
  /// ```
  T orDefault(T defaultValue) {
    return this ?? defaultValue;
  }
}
