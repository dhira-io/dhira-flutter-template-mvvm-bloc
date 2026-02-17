import 'package:flutter/material.dart';
import 'package:todo_app/l10n/app_localizations.dart';

class AppDialogs {
  static Future<void> showErrorDialog(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onConfirm,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title ?? l10n.error),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onConfirm != null) onConfirm();
            },
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  static Future<void> showConfirmationDialog(
    BuildContext context, {
    required String message,
    String? title,
    required VoidCallback onConfirm,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title ?? l10n.confirm),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
