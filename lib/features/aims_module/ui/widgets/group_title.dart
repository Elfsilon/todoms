import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/date_time.dart';

class GroupTitile extends StatelessWidget {
  const GroupTitile({
    super.key,
    required this.today,
    required this.groupDeadline,
  });

  final DateTime today;
  final DateTime groupDeadline;

  String _formatDeadline(DateTime deadline) {
    final dd = deadline.day.toString().padLeft(2, " ");
    final mm = months[deadline.month - 1];
    final yyyy = deadline.year;
    return "$dd $mm $yyyy";
  }

  String _restOfDays(DateTime today, DateTime other) {
    final daysLeft = other.difference(today).inDays;
    if (daysLeft < 0) return "Completed";
    if (daysLeft == 0) return "Today";
    if (daysLeft == 1) return "Tomorrow";
    return "$daysLeft days left";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.s8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Text(_formatDeadline(groupDeadline), style: TextStyle(
            color: AppTheme.of(context).palette.foreground.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
          const SizedBox(width: Constants.s2),
          Label(
            title: _restOfDays(today, groupDeadline),
          )
        ],
      ),
    );
  }
}
