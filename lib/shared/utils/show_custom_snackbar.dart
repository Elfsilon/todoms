import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';

void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: AppTheme.of(context).palette.custom.roseRed.muted,
        content: Row(
          children: [
            Icon(
              Icons.error_outline_rounded, 
              size: 24, 
              color: AppTheme.of(context).palette.custom.roseRed.primary
            ),
            const SizedBox(width: 4),
            Text(message, style: TextStyle(
              color: AppTheme.of(context).palette.custom.roseRed.primary,
            )),
          ],
        ), 
      )
    );
  }