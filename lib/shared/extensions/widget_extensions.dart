import 'package:flutter/material.dart';

/// Extension methods for [Widget] to simplify layout and event handling.
extension WidgetX on Widget {
  /// Wraps the widget with [Padding] on all sides.
  ///
  /// Example:
  /// ```dart
  /// widget.paddingAll(16);
  /// ```
  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  /// Wraps the widget with symmetric [Padding].
  ///
  /// Example:
  /// ```dart
  /// widget.paddingSymmetric(horizontal: 16, vertical: 8);
  /// ```
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Wraps the widget with a [Center] widget.
  ///
  /// Example:
  /// ```dart
  /// widget.center();
  /// ```
  Widget center() {
    return Center(child: this);
  }

  /// Wraps the widget with an [Expanded] widget.
  ///
  /// Example:
  /// ```dart
  /// widget.expanded(flex: 2);
  /// ```
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Wraps the widget with a [Flexible] widget.
  ///
  /// Example:
  /// ```dart
  /// widget.flexible(flex: 1);
  /// ```
  Widget flexible({int flex = 1}) {
    return Flexible(flex: flex, child: this);
  }

  /// Wraps the widget with a [GestureDetector] for [onTap] events.
  ///
  /// Example:
  /// ```dart
  /// widget.onTap(() => print("Tapped!"));
  /// ```
  Widget onTap(VoidCallback? callback) {
    return GestureDetector(
      onTap: callback,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Returns the widget if [condition] is true, otherwise returns a [SizedBox.shrink()].
  ///
  /// Example:
  /// ```dart
  /// widget.visible(isLoggedIn);
  /// ```
  Widget visible(bool condition) {
    return condition ? this : const SizedBox.shrink();
  }
}
