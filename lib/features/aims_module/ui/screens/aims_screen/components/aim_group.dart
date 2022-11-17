import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/components/aim_widget.dart';
import 'package:todoms/features/aims_module/ui/widgets/group_title.dart';
import 'package:todoms/features/aims_module/ui/widgets/progress_bar.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';
import 'package:todoms/shared/utils/get_progress_color.dart';

class AimGroup extends StatefulWidget {
  const AimGroup({
    super.key,
    required this.items,
    required this.today,
    required this.deadline,
    required this.onTapAim,
    required this.onDoubleTapAim,
    required this.onLongPressAim,
    required this.onTapAimStep,
    required this.onLongPressAimStep,
    required this.onDoubleTapHeader,
  });

  final DateTime deadline;
  final DateTime today;
  final List<Aim> items;
  final Function(DateTime deadline) onDoubleTapHeader;
  final Function(int id, bool status) onTapAim;
  final Function(int id) onDoubleTapAim;
  final Function(int id) onLongPressAim;
  final Function(int aimId, int stepId, bool status) onTapAimStep;
  final Function(int aimId, int stepId) onLongPressAimStep;

  @override
  State<AimGroup> createState() => _AimGroupState();
}

class _AimGroupState extends State<AimGroup> {
  bool expanded = true;

  void expand() {
    setState(() {
      expanded = !expanded;
    });
  }

  int get progress 
    => widget.items.fold(0, (acc, aim) => acc + aim.progress) ~/ widget.items.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onDoubleTap: () => widget.onDoubleTapHeader(widget.deadline),
                  child: GroupTitile(
                    today: widget.today,
                    groupDeadline: widget.deadline, 
                  ),
                ),
                GestureDetector(
                  onTap: expand,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded, 
                      size: Constants.s20, 
                      color: Palette.fgMid.primary
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.s16),
              child: ProgressBar(
                progress: progress / 100,
                progressBarColor: getProgressColor(progress.toDouble(), muted: false),
                backgroundColor: Palette.bgLight.primary,
              ),
            ),
          ] 
        ),
        const SizedBox(height: Constants.s12),
        if (expanded) ...widget.items.map((aim) => Padding(
            padding: const EdgeInsets.only(bottom: Constants.s8),
            child: AimWidget(
              aim: aim,
              onAimTap: widget.onTapAim,
              onAimDoubleTap: widget.onDoubleTapAim,
              onAimLongPress: widget.onLongPressAim,
              onAimStepTap: widget.onTapAimStep,
              onAimStepLongPress: widget.onLongPressAimStep,
            ),
          ),
        ),
      ]
    );
  }
}
