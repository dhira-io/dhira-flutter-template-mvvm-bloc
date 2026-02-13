import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color? cardColor;
  final Color? scaffoldBackground;
  final TextStyle? captionStyle;

  const AppThemeExtension({
    this.cardColor,
    this.scaffoldBackground,
    this.captionStyle,
  });

  @override
  AppThemeExtension copyWith({
    Color? cardColor,
    Color? scaffoldBackground,
    TextStyle? captionStyle,
  }) {
    return AppThemeExtension(
      cardColor: cardColor ?? this.cardColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      captionStyle: captionStyle ?? this.captionStyle,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      scaffoldBackground: Color.lerp(
        scaffoldBackground,
        other.scaffoldBackground,
        t,
      ),
      captionStyle: TextStyle.lerp(captionStyle, other.captionStyle, t),
    );
  }
}
