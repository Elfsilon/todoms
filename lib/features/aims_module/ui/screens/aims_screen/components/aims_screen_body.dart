import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/aims_screen.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/aim_group.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/shared/theme/app_theme.dart';

class AimsScreenBody extends StatelessWidget {
  const AimsScreenBody({
    super.key,
    required this.loading,
    required this.groups,
    required this.showCompleted,
    required this.addAim,
    required this.toggleAim,
    required this.toggleAimStep,
    required this.openAimBottomSheet,
    required this.openAddAimStepDialog,
    required this.openAimStepBottomSheet,
  });

  final bool loading;
  final bool showCompleted;
  final DecomposedGroups<Aim> groups;

  final Function(DateTime) addAim;
  final Function(int, bool) toggleAim;
  final Function(int) openAimBottomSheet;
  final Function(int) openAddAimStepDialog;
  final Function(int, int, bool) toggleAimStep;
  final Function(int, int) openAimStepBottomSheet;

  @override
  Widget build(BuildContext context) {
    final data = showCompleted ? groups.completed : groups.active;

    if (loading) {
      return Center(
        child: CircularProgressIndicator(
          color: AppTheme.of(context).palette.custom.merigold.primary,
        ),
      );
    } else if (data.items.isEmpty) {
      return const Center(
        child: Label(
          title: "No aims were added yet",
        )
      );
    }

    final today = DateTime.now();

    return ListView.builder(
      itemCount: data.items.length + 1,
      itemBuilder: (context, index) {
        if (index == data.items.length) return const SizedBox(height: 90);
        return AimGroup(
          today: today, 
          items: data.items[index].items, 
          deadline: data.items[index].items[0].deadline, 
          onTapAim: toggleAim,
          onDoubleTapAim: openAddAimStepDialog,
          onLongPressAim: openAimBottomSheet,
          onTapAimStep: toggleAimStep,
          onLongPressAimStep: openAimStepBottomSheet,
          onDoubleTapHeader: addAim,
        );
      } 
    );
  }
}