import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class Dialogs {
  final BuildContext context;

  Dialogs.of(this.context);

  showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        padding: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.red.withOpacity(.6),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        content: Row(
          children: [
            Icon(Icons.info_outline, color: AppColors.white),
            const SizedBox(width: 16),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}
