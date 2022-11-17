import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_dialog.dart';
import 'package:todoms/shared/utils/constants/categories.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

void showEditCategoryDialog(BuildContext context, {
  required Category initialValue, 
  required Function(Category) onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditCategoryDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}

class EditCategoryDialog extends StatefulWidget {
  const EditCategoryDialog({
    super.key,
    required this.onAction,
    required this.initialValue,
  });

  final Category initialValue;
  final Function(Category) onAction;

  @override
  State<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  List<Category> items = Categories.defaultCategories;
  late int _pickedIndex;

  @override
  void initState() {
    _pickedIndex = items.indexOf(widget.initialValue);
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      _pickedIndex = index;
    }); 
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(items[_pickedIndex]);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: "Choose category",
      description: "Some description", 
      onAction: () => _handleAction(context), 
      onClose: () => _close(context), 
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Palette.bgDark.primary,
          borderRadius: Constants.borderRadius12,
        ),
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(items.length, (index) => GestureDetector(
            onTap: () => onTap(index),
            child: _IconWidget(
              category: items[index],
              picked: index == _pickedIndex, 
            ),
          )),
        ),
      )
    );
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    super.key,
    required this.category,
    required this.picked,
  });

  final bool picked;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.s16),
      decoration: BoxDecoration(
        color: picked ? category.color.muted : null,
      ),
      child: Icon(
        category.icon, 
        size: Constants.s32,
        color: picked ? category.color.primary : Palette.fgDark.primary
      ),
    );
  }
}