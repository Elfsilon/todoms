import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class FullscreenDialog extends StatelessWidget {
  const FullscreenDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.color,
    required this.onAction,
    this.description,
  });

  final String title;
  final String? description;
  final String actionName;
  final CustomColor color;
  final Function()? onAction;

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    if (onAction != null) onAction!();
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.s12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        borderRadius: Constants.borderRadius12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          if (description != null) const SizedBox(height: Constants.s8),
          if (description != null) Text(description!, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: Constants.s8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onAction != null) ElevatedButton(
                onPressed: () => _handleAction(context), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color.primary),
                  overlayColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.crimsone.primary),
                ),
                child: Text(actionName),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => _close(context), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color.muted),
                  foregroundColor: MaterialStateProperty.all(color.primary),
                  overlayColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.crimsone.muted),
                ),
                child: const Text("Close"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}