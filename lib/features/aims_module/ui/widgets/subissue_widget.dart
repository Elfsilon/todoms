import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/status_badge.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class SubissueWidget extends StatelessWidget {
  const SubissueWidget({
    super.key,
    required this.title,
    required this.status,
  });

  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.s8, vertical: Constants.s12),
      decoration: BoxDecoration(
        color: AppTheme.of(context).palette.background.primary,
      ),
      child: Row(
        children: [
          Container(
            width: 66,
            alignment: Alignment.center,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppTheme.of(context).palette.foreground.tertiary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  color: AppTheme.of(context).palette.foreground.primary,
                  fontSize: 13,
                )),
              ],
            ),
          ),
          const SizedBox(width: Constants.s16),
          StatusBadge(status: status),
          const SizedBox(width: Constants.s16),
        ],
      ),
    );
  }
}
