import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

// void showSnackBar(BuildContext context, String message) {
//   final messenger = ScaffoldMessenger.of(context);

//   // Dismiss the currently visible SnackBar, if any
//   messenger.hideCurrentSnackBar();

//   // Show a new SnackBar
//   messenger.showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 3),
//       content: Text(message, style: AppStyles.semibold12.copyWith(color: Colors.white)),
//       backgroundColor: Colors.black,
//     ),
//   );
// }

void showSnackBarFailure(BuildContext context, String message,
    {Duration? duration}) {
  final messenger = ScaffoldMessenger.of(context);

  // Dismiss the currently visible SnackBar, if any
  messenger.hideCurrentSnackBar();

  final theme = Theme.of(context);
  final bgColor = theme.colorScheme.error;
  final textColor = theme.colorScheme.onError;

  // Show a new SnackBar
  messenger.showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(seconds: 5),
      behavior: SnackBarBehavior.fixed,
      // margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottomInset),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      elevation: 6,
      backgroundColor: bgColor,
      content: Row(
        children: [
          Icon(Icons.error_outline, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppStyles.medium14.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    ),
  );
}

void showSnackBarSuccess(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.of(context);

  // Dismiss the currently visible SnackBar, if any
  messenger.hideCurrentSnackBar();

  final bgColor = Colors.green;
  final textColor = Colors.white;

  // Show a new SnackBar
  messenger.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      // margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottomInset),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      elevation: 6,
      backgroundColor: bgColor,
      content: Row(
        children: [
          Icon(Icons.check_circle, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppStyles.medium14.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    ),
  );
}
