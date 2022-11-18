import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/aims_screen.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/get_swatch.dart';

class TodomsApp extends StatelessWidget {
  const TodomsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoms',
      theme: ThemeData(
        primarySwatch: MaterialColor(500, getSwatch(AppTheme.of(context).palette.custom.merigold.primary)),
        brightness: Brightness.dark,
        backgroundColor: AppTheme.of(context).palette.background.secondary,
        fontFamily: "Nunito",

        // Text theme
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: AppTheme.of(context).palette.foreground.secondary,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: Constants.s16),
          prefixIconColor: AppTheme.of(context).palette.foreground.secondary,
          suffixIconColor: AppTheme.of(context).palette.foreground.secondary,
          filled: true,
          fillColor: AppTheme.of(context).palette.background.primary,
          errorStyle: TextStyle(color: AppTheme.of(context).palette.custom.roseRed.primary),
          border: const OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              color: AppTheme.of(context).palette.custom.merigold.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              color: AppTheme.of(context).palette.custom.roseRed.primary,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              color: AppTheme.of(context).palette.custom.roseRed.primary,
              width: 2,
            ),
          ),
        ),

        // Button themes
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.merigold.muted),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.bumblebee.muted),
            foregroundColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.merigold.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: Constants.borderRadius16,
            )),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return AppTheme.of(context).palette.foreground.tertiary;
              return AppTheme.of(context).palette.custom.merigold.primary;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return AppTheme.of(context).palette.foreground.secondary;
              return AppTheme.of(context).palette.foreground.primary;
            }),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(AppTheme.of(context).palette.custom.bumblebee.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: Constants.borderRadius16,
            )),
          ),
        ),
      ),
      home: const AimsScreen(),
    );
  }
}