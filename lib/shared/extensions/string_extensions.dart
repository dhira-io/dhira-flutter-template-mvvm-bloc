/// Extension methods for [String] to simplify validation and formatting.
extension StringX on String {
  /// Returns true if the string is empty or contains only whitespace.
  ///
  /// Example:
  /// ```dart
  /// bool empty = "".isNullOrEmpty; // true
  /// ```
  bool get isNullOrEmpty => trim().isEmpty;

  /// Returns true if the string is a valid email address.
  ///
  /// Example:
  /// ```dart
  /// bool valid = "test@example.com".isEmail; // true
  /// ```
  bool get isEmail {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(this);
  }

  /// Returns true if the string is a valid phone number (basic validation).
  ///
  /// Example:
  /// ```dart
  /// bool valid = "1234567890".isPhoneNumber; // true
  /// ```
  bool get isPhoneNumber {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegex.hasMatch(this);
  }

  /// Capitalizes the first letter of the string.
  ///
  /// Example:
  /// ```dart
  /// String capitalized = "hello".capitalize; // "Hello"
  /// ```
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts the string to title case (capitalizes the first letter of each word).
  ///
  /// Example:
  /// ```dart
  /// String titled = "hello world".titleCase; // "Hello World"
  /// ```
  String get titleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Removes extra spaces from the string (leading, trailing, and multiple internal spaces).
  ///
  /// Example:
  /// ```dart
  /// String cleaned = "  hello   world  ".removeExtraSpaces; // "hello world"
  /// ```
  String get removeExtraSpaces {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Parses the string to an [int], returns null if parsing fails.
  ///
  /// Example:
  /// ```dart
  /// int? value = "123".toIntOrNull; // 123
  /// ```
  int? get toIntOrNull => int.tryParse(this);

  /// Parses the string to a [double], returns null if parsing fails.
  ///
  /// Example:
  /// ```dart
  /// double? value = "123.45".toDoubleOrNull; // 123.45
  /// ```
  double? get toDoubleOrNull => double.tryParse(this);
}
