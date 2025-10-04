import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

void showSnackBar(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.of(context);
  
  // Dismiss the currently visible SnackBar, if any
  messenger.hideCurrentSnackBar();

  // Show a new SnackBar
  messenger.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message, style: AppStyles.semibold12.copyWith(color: Colors.white)),
      backgroundColor: Colors.black,
    ),
  );
}


// void showSnackBar(BuildContext context, String message) {
//   final messenger = ScaffoldMessenger.of(context);
  
//   // Dismiss the currently visible SnackBar, if any
//   messenger.hideCurrentSnackBar();

//   final theme = Theme.of(context);
//   final bgColor = theme.colorScheme.error;
//   final textColor = theme.colorScheme.onError;

//   // Show a new SnackBar styled for error messages
//   messenger.showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 3),
//       behavior: SnackBarBehavior.floating,
//       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 6,
//       backgroundColor: bgColor,
//       content: Row(
//         children: [
//           Icon(Icons.error_outline, color: textColor),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               message,
//               style: AppStyles.medium14.copyWith(color: textColor),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }