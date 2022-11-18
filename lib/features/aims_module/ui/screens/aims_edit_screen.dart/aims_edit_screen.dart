import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todoms/features/aims_module/ui/controllers/aim_controller.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/action_button.dart';
import 'package:todoms/features/aims_module/ui/widgets/choise_dialog/priority_choise_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_content_button/edit_content_button.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_content_button/edit_category_content_button.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_category_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_deadline_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_text_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/pushed_screen_template.dart';
import 'package:todoms/shared/theme/app_theme.dart';

class AimEditScreen extends ConsumerWidget {
  const AimEditScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aimControllerProvider);
    final data = state.value.take(id);
    final controller = ref.read(aimControllerProvider.notifier);

    return PushedScreenTemplate(
      title: "Edit aim",
      items: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EditContentButton(
                  title: "Title", 
                  nullable: false,
                  content: data.title, 
                  onPressed: () => showEditTextDialog(
                    context, 
                    label: "Edit title", 
                    description: "Some description of the dialog",
                    initialValue: data.title, 
                    onAction: (value) => controller.update(id, title: value),
                  ),
                ),
                EditContentButton(
                  title: "Priority", 
                  content: data.priority.toString(), 
                  onPressed: () => showChoisePriorityDialog(
                    context, 
                    initialValue: data.priority, 
                    onAction: (value) => controller.update(id, priority: value),
                  ),
                ),
                EditContentButton(
                  title: "Deadline", 
                  content: DateFormat("dd.MM.yyyy").format(data.deadline), 
                  onPressed: () => showEditDeadlineDialog(
                    context, 
                    label: "Edit deadline", 
                    description: "Some description of the dialog", 
                    initialValue: data.deadline, 
                    onAction: (value) => controller.update(id, deadline: value),
                  ),
                ),
                EditCategoryContentButton(
                  category: data.category,
                  onPressed: () => showEditCategoryDialog(
                    context, 
                    initialValue: data.category, 
                    onAction: (value) => controller.update(id, category: value),
                  ),
                ),
              ],
            ),
          ),
        ),
        ActionButton(
          autoPop: false,
          label: data.imrotant != null && data.imrotant! ? "Important" : "Common", 
          fillColor: data.imrotant != null && data.imrotant! ? AppTheme.of(context).palette.custom.green : AppTheme.of(context).palette.custom.crimsone,
          icon: data.imrotant != null && data.imrotant! ? Icons.keyboard_double_arrow_up_rounded : Icons.keyboard_double_arrow_down_rounded, 
          onAction: () {
            if (data.imrotant != null) {
              controller.update(id, important: !data.imrotant!);
            }
          }
        ),
      ],
    );
  }
}