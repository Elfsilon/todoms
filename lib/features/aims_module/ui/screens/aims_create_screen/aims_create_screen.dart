import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/features/aims_module/ui/controllers/aim_controller.dart';
import 'package:todoms/features/aims_module/ui/widgets/choise_dialog/priority_choise_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_content_button/edit_content_button.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_content_button/edit_category_content_button.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_category_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_deadline_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_text_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/pushed_screen_template.dart';
import 'package:todoms/shared/utils/constants/categories.dart';

class AimCreateScreen extends ConsumerStatefulWidget {
  const AimCreateScreen({
    super.key,
    this.deadline,
  });

  final DateTime? deadline;

  @override
  AimCreateScreenState createState() => AimCreateScreenState();
}

class AimCreateScreenState extends ConsumerState<AimCreateScreen> {
  String title = "";
  Category category = Categories.defaultCategories[0];
  DateTime deadline = DateTime.now();
  int priority = 1;

  @override
  void initState() {
    if (widget.deadline != null) {
      deadline = widget.deadline!;
    }
    super.initState();
  }

  void onCreate() {
    final controller = ref.read(aimControllerProvider.notifier);
    controller.add(
      title: title, 
      category: category, 
      deadline: deadline, 
      priority: priority
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final formatedDeadline = DateFormat("dd.MM.yyyy").format(deadline);
    final screenTitle = widget.deadline != null ? "Add new aim to $formatedDeadline" : "Add new aim";

    return PushedScreenTemplate(
      title: screenTitle,
      items: [
        EditContentButton(
          title: "Title", 
          nullable: false,
          content: title, 
          onPressed: () => showEditTextDialog(
            context, 
            label: "Edit title", 
            description: "Some description of the dialog",
            initialValue: title, 
            onAction: (value) {
              setState(() {
                title = value ?? "";
              });
            }
          ),
        ),
        EditContentButton(
          title: "Priority", 
          content: priority.toString(), 
          onPressed: () => showChoisePriorityDialog(
            context, 
            initialValue: priority, 
            onAction: (value) {
              setState(() {
                priority = value;
              });
            }
          ),
        ),
        EditContentButton(
          title: "Deadline",
          disabled: widget.deadline != null, 
          content: DateFormat("dd.MM.yyyy").format(deadline), 
          onPressed: () => showEditDeadlineDialog(
            context, 
            label: "Edit deadline", 
            description: "Some description of the dialog", 
            initialValue: deadline, 
            onAction: (value) {
              setState(() {
                deadline = value;
              });
            }
          ),
        ),
        EditCategoryContentButton(
          category: category,
          onPressed: () => showEditCategoryDialog(
            context, 
            initialValue: category, 
            onAction: (value) {
              setState(() {
                category = value;
              });
            }
          ),
        ),
      ],
      action: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onCreate, 
          child: const Text("Create"),
        ),
      ),
    );
  }
}