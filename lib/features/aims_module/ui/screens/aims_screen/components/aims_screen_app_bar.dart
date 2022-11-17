import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/custom_appbar.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

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
          ? const Label(
            prefixIcon: Icons.history_rounded,
            color: Palette.flameOrange,
            size: LabelSize.large,
          ) 
          : const Label(
            prefixIcon: Icons.today_rounded,
            color: Palette.merigold,
            size: LabelSize.large,
          ),
      ),
    );
  }
}