import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/ui/widgets/issue_widget.dart';
import 'package:todoms/features/aims_module/ui/widgets/label.dart';
import 'package:todoms/features/aims_module/ui/widgets/subissue_widget.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class AimWidget extends StatefulWidget {
  const AimWidget({
    super.key,
    required this.aim,
    required this.onAimTap,
    required this.onAimDoubleTap,
    required this.onAimLongPress,
    required this.onAimStepTap,
    required this.onAimStepLongPress,
  });

  final Aim aim;
  final Function(int id, bool status) onAimTap;
  final Function(int id) onAimDoubleTap;
  final Function(int id) onAimLongPress;
  final Function(int aimId, int stepId, bool status) onAimStepTap;
  final Function(int aimId, int stepId) onAimStepLongPress;

  @override
  State<AimWidget> createState() => _AimWidgetState();
}

class _AimWidgetState extends State<AimWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => widget.onAimTap(widget.aim.id, !widget.aim.done),
          onDoubleTap: () => widget.onAimDoubleTap(widget.aim.id),
          onHorizontalDragStart: (details) => setState(() {
            expanded = !expanded;
          }),
          onLongPress: () => widget.onAimLongPress(widget.aim.id),
          child: IssueWidget(
            progress: widget.aim.progress / 100,
            title: widget.aim.title,
            category: widget.aim.category,
            important: widget.aim.imrotant,
            status: widget.aim.done,
            labels:  [
              Label(
                title: "${widget.aim.progress}%",
                color: widget.aim.progress < 40 
                  ? Palette.crimsone 
                  : widget.aim.progress < 80 
                    ? Palette.merigold
                    : widget.aim.category.color,
              ),
              Label(
                title: widget.aim.priority.toString(),
                suffixIcon: Icons.flag_rounded,
                color: widget.aim.category.color
              ),
              Label(
                title: widget.aim.category.name,
                color: widget.aim.category.color
              ),
              if (widget.aim.steps.isNotEmpty) Label(
                title: "${widget.aim.steps.length} step${widget.aim.steps.length > 1 ? 's' : ''}",
                prefixIcon: Icons.check_circle_outline_rounded,
              ),
            ],
          ),
        ),
        if (expanded) ...widget.aim.steps.map((step) => GestureDetector(
          onTap: () => widget.onAimStepTap(widget.aim.id, step.localId, !step.done),
          onLongPress: () => widget.onAimStepLongPress(widget.aim.id, step.localId),
          child: SubissueWidget(
            title: step.title,
            status: step.done,
          ),
        ),
        ),
      ],
    );
  }
}
