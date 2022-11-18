import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/custom_appbar.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/theme/app_theme.dart';

class AimsScreenAppBar extends StatelessWidget {
  const AimsScreenAppBar({
    super.key,
    required this.showCompleted,
    required this.onTap,
  });

  final bool showCompleted;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      height: Constants.appBarHeight, 
      title: "Aims",
      child: GestureDetector(
        onTap: onTap,
        child: showCompleted 
          ? Label(
            prefixIcon: Icons.history_rounded,
            color: AppTheme.of(context).palette.custom.flameOrange,
            size: LabelSize.large,
          ) 
          : Label(
            prefixIcon: Icons.today_rounded,
            color: AppTheme.of(context).palette.custom.merigold,
            size: LabelSize.large,
          ),
      ),
    );
  }
}