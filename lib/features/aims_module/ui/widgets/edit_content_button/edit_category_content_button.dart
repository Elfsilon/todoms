import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_content_button/edit_content_button.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class EditCategoryContentButton extends StatelessWidget {
  const EditCategoryContentButton({
    super.key,
    required this.category,
    required this.onPressed,
    this.disabled = false,
  });

  final Category category;
  final bool disabled;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return EditContentButton(
      title: "Category",
      disabled: disabled,
      content: category.name,
      nullable: false,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(Constants.s4),
        decoration: BoxDecoration(
          color: category.color.muted,
          borderRadius: Constants.borderRadius8,
        ),
        child: Icon(
          category.icon,
          color: category.color.primary
        ),
      ),
    );
  }
}