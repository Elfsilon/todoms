import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class EditContentButton extends StatelessWidget {
  const EditContentButton({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
    this.nullable = true,
    this.disabled = false,
    this.child,
  });

  final String title;
  final bool nullable;
  final String? content;
  final Widget? child;
  final bool disabled;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: disabled ? null : onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(disabled ? Colors.transparent : Palette.fgDark.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.s16, vertical: Constants.s8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                disabled 
                  ? Icon(Icons.lock, color: Palette.fgMid.primary)
                  : Icon(Icons.edit_rounded, color: Palette.fgMid.primary),
                const SizedBox(width: Constants.s12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: title, style: Theme.of(context).textTheme.bodySmall),
                            if (!nullable) TextSpan(
                              text: " *", 
                              style: Theme.of(context).textTheme.bodySmall!
                                .apply(color: Palette.roseRed.primary)
                            ),
                          ]
                        )
                      ),
                      const SizedBox(height: Constants.s4),
                      content != null && content!.isNotEmpty 
                      ? Text(
                        content!, 
                        style: disabled 
                          ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: Palette.fgMid.primary)
                          : Theme.of(context).textTheme.bodyLarge,
                      )
                      : Text("Not set", style: 
                          Theme.of(context).textTheme.bodyLarge!.apply(color: Palette.fgMid.primary)
                        ),
                    ],
                  ),
                ),
                if (child != null) child as Widget,
              ],
            ), 
          ),
        ),
        Constants.divider,
      ]
    );
  }
}