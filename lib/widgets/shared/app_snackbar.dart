import 'package:flutter/material.dart';

/// Shows a floating snackbar with a bold title and a message.
///
/// [action] is used by the undo flows; keeping it here means every snackbar
/// shares the same layout and timing.
void showAppSnackBar(
  BuildContext context, {
  required String title,
  required String message,
  SnackBarAction? action,
  Duration duration = const Duration(seconds: 4),
  bool isError = false,
}) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: duration,
        action: action,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: isError ? theme.colorScheme.error : null,
              ),
            ),
            const SizedBox(height: 2),
            Text(message),
          ],
        ),
      ),
    );
}

void showErrorSnackBar(
  BuildContext context, {
  required String title,
  required String message,
  SnackBarAction? action,
}) {
  showAppSnackBar(
    context,
    title: title,
    message: message,
    action: action,
    isError: true,
  );
}
