import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/choise_dialog/chiose_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/choise_dialog/types.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

const defaultPriorities = [1, 2, 3, 4, 5, 6, 7, 8];

void showChoisePriorityDialog(BuildContext context, {
  required int initialValue,
  required DialogAction<int> onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return PriorityChoiseDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}

class PriorityChoiseDialog extends StatelessWidget {
  const PriorityChoiseDialog({
    super.key,
    required this.initialValue,
    required this.onAction,
  });

  final int initialValue;
  final DialogAction<int> onAction;

  @override
  Widget build(BuildContext context) {
    return ChoiseDialog<int>(
      label: "Choose priority", 
      description: "Some dialog description", 
      initialValue: initialValue,
      values: defaultPriorities,
      cellBuilder: (selected, value) => _Cell(value: value, selected: selected),
      onAction: onAction,
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    super.key,
    required this.value,
    required this.selected,
  });

  final int value;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.s16),
      decoration: BoxDecoration(
        color: selected ? AppTheme.of(context).palette.custom.merigold.muted : null,
      ),
      child: Center(
        child: Text(value.toString(), style: TextStyle(
          color: selected ? AppTheme.of(context).palette.custom.merigold.primary : AppTheme.of(context).palette.foreground.secondary,
        )),
      ),
    );
  }
}