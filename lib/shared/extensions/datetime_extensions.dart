/// Extension methods for [DateTime] to simplify formatting and comparison.
extension DateTimeX on DateTime {
  /// Returns a readable date string (e.g., "Jan 1, 2024").
  ///
  /// Example:
  /// ```dart
  /// String date = DateTime.now().toReadableDate();
  /// ```
  String toReadableDate() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[month - 1]} $day, $year';
  }

  /// Returns a readable date and time string (e.g., "Jan 1, 2024 10:30 AM").
  ///
  /// Example:
  /// ```dart
  /// String dateTime = DateTime.now().toReadableDateTime();
  /// ```
  String toReadableDateTime() {
    final period = hour >= 12 ? 'PM' : 'AM';
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    final m = minute.toString().padLeft(2, '0');
    return '${toReadableDate()} $h:$m $period';
  }

  /// Returns true if the date is today.
  ///
  /// Example:
  /// ```dart
  /// bool today = DateTime.now().isToday; // true
  /// ```
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Returns true if the date was yesterday.
  ///
  /// Example:
  /// ```dart
  /// bool yesterday = DateTime.now().subtract(const Duration(days: 1)).isYesterday; // true
  /// ```
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Returns a "time ago" string (e.g., "5 min ago", "2 days ago").
  ///
  /// Example:
  /// ```dart
  /// String ago = someDateTime.timeAgo(); // "2 hours ago"
  /// ```
  String timeAgo() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays >= 365) return '${(diff.inDays / 365).floor()} years ago';
    if (diff.inDays >= 30) return '${(diff.inDays / 30).floor()} months ago';
    if (diff.inDays >= 7) return '${(diff.inDays / 7).floor()} weeks ago';
    if (diff.inDays >= 1) return '${diff.inDays} days ago';
    if (diff.inHours >= 1) return '${diff.inHours} hours ago';
    if (diff.inMinutes >= 1) return '${diff.inMinutes} mins ago';
    return 'Just now';
  }

  /// Returns the start of the day (00:00:00).
  ///
  /// Example:
  /// ```dart
  /// DateTime start = DateTime.now().startOfDay;
  /// ```
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns the end of the day (23:59:59).
  ///
  /// Example:
  /// ```dart
  /// DateTime end = DateTime.now().endOfDay;
  /// ```
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);
}
