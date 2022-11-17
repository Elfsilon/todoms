import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Palette.roseRed.muted,
        content: Row(
          children: [
            Icon(
              Icons.error_outline_rounded, 
              size: 24, 
              color: Palette.roseRed.primary
            ),
            const SizedBox(width: 4),
            Text(message, style: TextStyle(
              color: Palette.roseRed.primary,
            )),
          ],
        ), 
      )
    );
  }