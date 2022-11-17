import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/date_picker.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_dialog.dart';

void showEditDeadlineDialog(BuildContext context, {
  required String label,
  required String? description,
  required DateTime initialValue, 
  required Function(DateTime) onAction,
  bool nullable = false,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditDeadlineDialog(
        initialValue: initialValue,
        label: label, 
        description: description,
        nullable: nullable,
        onAction: onAction,
      );
    }, 
  );
}

class EditDeadlineDialog extends StatefulWidget {
  const EditDeadlineDialog({
    super.key,
    required this.label,
    required this.onAction,
    required this.initialValue,
    this.description,
    this.nullable = false,
  });

  final String label;
  final String? description;
  final DateTime initialValue;
  final bool nullable;
  final Function(DateTime) onAction;

  @override
  State<EditDeadlineDialog> createState() => _EditDeadlineDialogState();
}

class _EditDeadlineDialogState extends State<EditDeadlineDialog> {
  late DateTime _selectedDate;

  @override
  void initState() {
    _selectedDate = widget.initialValue;
    super.initState();
  }

  void onDateChanged(DateTime value) {
    setState(() {
      _selectedDate = value;
    });    
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(_selectedDate);
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
        height: 350,
        child: DatePicker(
          initialDate: widget.initialValue, 
          focusedDate: DateTime.now(),
          onSelect: onDateChanged,
        ),
      ),
    );
  }
}