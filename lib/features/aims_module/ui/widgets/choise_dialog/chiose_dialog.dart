import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/choise_dialog/types.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_dialog.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

void showChoiseDialog<T>(BuildContext context, {
  required String label,
  required String description,
  required T initialValue,
  required List<T> values,
  required CellBuilder<T> cellBuilder,
  required DialogAction<T> onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return ChoiseDialog<T>(
        label: label,
        description: description,
        initialValue: initialValue,
        values: values,
        cellBuilder: cellBuilder,
        onAction: onAction,
      );
    }, 
  );
}

class ChoiseDialog<T> extends StatefulWidget {
  const ChoiseDialog({
    super.key,
    required this.label,
    required this.description,
    required this.initialValue,
    required this.values,
    required this.cellBuilder,
    this.onAction,
  });

  final String label;
  final String description;

  final T initialValue;
  final List<T> values;
  final DialogAction<T> onAction;
  final CellBuilder<T> cellBuilder;

  @override
  State<ChoiseDialog<T>> createState() => _ChoiseDialogDialogState<T>();
}

class _ChoiseDialogDialogState<T> extends State<ChoiseDialog<T>> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.values.indexOf(widget.initialValue);
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    }); 
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    if (widget.onAction != null) widget.onAction!(widget.values[_selectedIndex]);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: widget.label,
      description: widget.description, 
      onAction: () => _handleAction(context), 
      onClose: () => _close(context), 
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: AppTheme.of(context).palette.background.primary,
          borderRadius: Constants.borderRadius12,
        ),
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(widget.values.length, (index) => GestureDetector(
            onTap: () => onTap(index),
            child: widget.cellBuilder(index == _selectedIndex, widget.values[index]), 
          )),
        ),
      )
    );
  }
}