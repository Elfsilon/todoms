import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/widgets/custom_appbar.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

class PushedScreenTemplate extends StatelessWidget {
  const PushedScreenTemplate({
    super.key,
    required this.title,
    required this.items,
    this.action,
  });

  final String title;
  final List<Widget> items;
  final Widget? action;

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).palette.background.primary,
      appBar: CustomAppBar(
        height: Constants.appBarHeight, 
        title: title,
        child: GestureDetector(
          onTap: () => close(context),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Constants.s12, Constants.s12, 0, Constants.s12),
            child: Icon(
              Icons.close, 
              size: Constants.s32, 
              color: AppTheme.of(context).palette.foreground.secondary
            ),
          ),
        ) 
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
          ),
          if (action != null) SizedBox(
            width: double.infinity,
            child: action,
          ),
        ],
      ),
    );
  }
}