import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/features/aims_module/ui/widgets/sign.dart';
import 'package:todoms/features/aims_module/ui/widgets/status_badge.dart';
import 'package:todoms/features/aims_module/ui/widgets/with_progress_bar.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class IssueWidget extends StatelessWidget {
  const IssueWidget({
    super.key,
    required this.title,
    required this.category,
    required this.labels,
    required this.status,
    this.important,
    this.progress,
  });

  final Category category;
  final String title;
  final bool? important;
  final List<Label> labels;
  final bool status;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.s12),
      child: WithProgressBar(
        progress: progress ?? 0,
        progressBarColor: AppTheme.of(context).palette.foreground.tertiary,
        backgroundColor: AppTheme.of(context).palette.background.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.s12, vertical: Constants.s12),
          child: Row(
            children: [
              Sign(
                icon: category.icon, 
                color: category.color, 
                important: important != null && important!
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                      color: AppTheme.of(context).palette.foreground.primary,
                      fontSize: 13,
                    )),
                    const SizedBox(height: 4),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      direction: Axis.horizontal,
                      children: labels,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              StatusBadge(status: status),
            ],
          ), 
        ),
      ),
    ); 
  }
}