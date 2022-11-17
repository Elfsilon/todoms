import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoms/features/aims_module/ui/controller_widgets/app_state_saver.dart';
import 'package:todoms/features/aims_module/ui/controllers/aim_controller.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_create_screen/aims_create_screen.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/action_button.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/aims_screen_body.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/bottom_sheet.dart';
import 'package:todoms/features/aims_module/ui/widgets/custom_appbar.dart';
import 'package:todoms/features/aims_module/ui/widgets/edit_dialog/edit_text_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/fullscreen_dialog.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/models/group.dart';
import 'package:todoms/shared/models/group_list.dart';
import 'package:todoms/shared/router/app_router.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';
import 'package:vibration/vibration.dart';

class DecomposedGroups<T extends Groupable> {
  const DecomposedGroups({
    required this.completed,
    required this.active,
  });

  factory DecomposedGroups.from(GroupList<T> groups) {
    final completedGroups = <Group<T>>[];
    final activeGroups = <Group<T>>[];

    for (var group in groups.items) {
      if (group.completed) {
        completedGroups.add(group);
      } else {
        activeGroups.add(group);
      }
    }

    return DecomposedGroups(
      completed: GroupList(completedGroups), 
      active: GroupList(activeGroups),
    );
  }

  final GroupList<T> completed;
  final GroupList<T> active;
}

class AimsScreen extends ConsumerStatefulWidget {
  const AimsScreen({
    super.key,
  });

  @override
  AimsScreenState createState() => AimsScreenState();
}

class AimsScreenState extends ConsumerState<AimsScreen> {
  bool showCompleted = false;

  void toggleAim(int id, bool value) {
    final controller = ref.read(aimControllerProvider.notifier);
    controller.update(id, done: value);
  }

  void toggleAimStep(int aimId, int stepId, bool value) {
    final controller = ref.read(aimControllerProvider.notifier);
    controller.updateStep(aimId, stepId, done: value);
  }

  void deleteAim(int id) {
    final controller = ref.read(aimControllerProvider.notifier);
    showDialog(
      context: context, 
      builder: (context) => FullscreenDialog(
        title: "Are you sure?", 
        actionName: "Delete", 
        description: "It will be impossible to restore deleted data",
        color: Palette.roseRed, 
        onAction: () => controller.delete(id),
      ),
    );
  }

  void deleteAimStep(int aimId, int stepId) {
    final controller = ref.read(aimControllerProvider.notifier);
    showDialog(
      context: context, 
      builder: (context) => FullscreenDialog(
        title: "Are you sure?", 
        actionName: "Delete", 
        description: "It will be impossible to restore deleted data",
        color: Palette.roseRed, 
        onAction: () => controller.deleteStep(aimId, stepId),
      ),
    );
  }

  void openAddAimStepDialog(int id) {
    final controller = ref.read(aimControllerProvider.notifier);
    showEditTextDialog(
      context, 
      label: "Add step", 
      description: "Some description of the dialog", 
      initialValue: "", 
      nullable: false,
      onAction: (value) {
        if (value != null) {
          controller.addStep(id, title: value);
        }
      }
    );
  }

  void openEditAimPage(int id) {
    AppRouter.openPage(context, PageNames.editAim, id);
  }

  void openEditAimStepDialog(int aimId, int stepId) {
    final controller = ref.read(aimControllerProvider.notifier);
    showEditTextDialog(
      context, 
      label: "Add step", 
      description: "Some description of the dialog", 
      initialValue: controller.takeStep(aimId, stepId).title, 
      nullable: false,
      onAction: (value) {
        if (value != null) {
          controller.updateStep(aimId, stepId, title: value);
        }
      }
    );
  }

  void openAimBottomSheet(int id) {
    Vibration.vibrate(
      duration: 100,
      amplitude: 50,
    );
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) => CustomBottomSheet(
        actions: [
          ActionButton(
            label: "Edit", 
            icon: Icons.edit_rounded, 
            filled: false,
            onAction: () => openEditAimPage(id),
          ),
          ActionButton(
            label: "Add step", 
            filled: false,
            icon: Icons.add_rounded, 
            onAction: () => openAddAimStepDialog(id)
          ),
          ActionButton(
            label: "Delete", 
            icon: Icons.edit_rounded, 
            onAction: () => deleteAim(id),
          ),
        ],
      ),
    );
  }

  void openAimStepBottomSheet(int aimId, int stepId) {
    Vibration.vibrate(
      duration: 100,
      amplitude: 50,
    );
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) => CustomBottomSheet(
        actions: [
          ActionButton(
            label: "Edit", 
            icon: Icons.edit_rounded, 
            filled: false,
            onAction: () => openEditAimStepDialog(aimId, stepId),
          ),
          ActionButton(
            label: "Delete", 
            icon: Icons.edit_rounded, 
            onAction: () => deleteAimStep(aimId, stepId),
          ),
        ],
      ),
    );
  }

  void addAim(DateTime? deadline) {
    openScreen(context, screen: AimCreateScreen(deadline: deadline));
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(aimControllerProvider);

    final groups = GroupList.from(controller.value.items);
    groups.sort();
    final decomposedGroups = DecomposedGroups.from(groups);
    
    return AppStateSaver(
      provider: aimControllerProvider,
      child: Scaffold(
        backgroundColor: Palette.bgDark.primary,
        appBar: CustomAppBar(
          height: Constants.appBarHeight, 
          title: "Aims",
          child: GestureDetector(
            onTap: () {
              setState(() => showCompleted = !showCompleted);
            },
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
        ),
        body: AimsScreenBody(
          loading: controller.loading, 
          showCompleted: showCompleted,
          groups: decomposedGroups, 
          addAim: addAim, 
          toggleAim: toggleAim, 
          toggleAimStep: toggleAimStep, 
          openAimBottomSheet: openAimBottomSheet, 
          openAddAimStepDialog: openAddAimStepDialog, 
          openAimStepBottomSheet: openAimStepBottomSheet
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              right: Constants.s16,
              bottom: Constants.s16,
              child: FloatingActionButton(
                backgroundColor: Palette.merigold.primary,
                onPressed: () => addAim(null),
                child: Icon(Icons.add, color: Palette.fgLight.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}