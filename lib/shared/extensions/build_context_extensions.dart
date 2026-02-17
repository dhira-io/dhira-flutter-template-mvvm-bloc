import 'package:flutter/material.dart';

/// Extension methods for [BuildContext] to simplify access to common properties and utilities.
extension BuildContextX on BuildContext {
  /// Returns the [MediaQueryData] for the current context.
  ///
  /// Example:
  /// ```dart
  /// final mediaQuery = context.mediaQuery;
  /// ```
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the screen width.
  ///
  /// Example:
  /// ```dart
  /// double width = context.screenWidth;
  /// ```
  double get screenWidth => mediaQuery.size.width;

  /// Returns the screen height.
  ///
  /// Example:
  /// ```dart
  /// double height = context.screenHeight;
  /// ```
  double get screenHeight => mediaQuery.size.height;

  /// Returns the safe area padding.
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets padding = context.safeAreaPadding;
  /// ```
  EdgeInsets get safeAreaPadding => mediaQuery.padding;

  /// Returns the [ThemeData] for the current context.
  ///
  /// Example:
  /// ```dart
  /// Color primaryColor = context.theme.primaryColor;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] for the current context.
  ///
  /// Example:
  /// ```dart
  /// TextStyle? headline = context.textTheme.headlineLarge;
  /// ```
  TextTheme get textTheme => theme.textTheme;

  /// Returns true if the app is currently in dark mode.
  ///
  /// Example:
  /// ```dart
  /// bool dark = context.isDarkMode;
  /// ```
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Returns true if the screen width is less than 600.
  ///
  /// Example:
  /// ```dart
  /// if (context.isMobile) { ... }
  /// ```
  bool get isMobile => screenWidth < 600;

  /// Returns true if the screen width is between 600 and 1024 (inclusive).
  ///
  /// Example:
  /// ```dart
  /// if (context.isTablet) { ... }
  /// ```
  bool get isTablet => screenWidth >= 600 && screenWidth <= 1024;

  /// Returns true if the screen width is greater than 1024.
  ///
  /// Example:
  /// ```dart
  /// if (context.isDesktop) { ... }
  /// ```
  bool get isDesktop => screenWidth > 1024;
}
