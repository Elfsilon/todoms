import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/ui/screens/aims_screen/aims_screen.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/palette.dart';
import 'package:todoms/shared/utils/get_swatch.dart';

class TodomsApp extends StatelessWidget {
  const TodomsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoms',
      theme: ThemeData(
        primarySwatch: MaterialColor(500, getSwatch(Palette.merigold.primary)),
        brightness: Brightness.dark,
        backgroundColor: Palette.bgMid.primary,
        fontFamily: "Nunito",

        // Text theme
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Palette.fgMid.primary,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: Constants.s16),
          prefixIconColor: Palette.fgMid.primary,
          suffixIconColor: Palette.fgMid.primary,
          filled: true,
          fillColor: Palette.bgDark.primary,
          errorStyle: TextStyle(color: Palette.roseRed.primary),
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
              color: Palette.merigold.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              color: Palette.roseRed.primary,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: Constants.borderRadius16,
            borderSide: BorderSide(
              color: Palette.roseRed.primary,
              width: 2,
            ),
          ),
        ),

        // Button themes
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Palette.merigold.muted),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(Palette.bumblebee.muted),
            foregroundColor: MaterialStateProperty.all(Palette.merigold.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: Constants.borderRadius16,
            )),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return Palette.bgLight.primary;
              return Palette.merigold.primary;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return Palette.fgMid.primary;
              return Palette.fgLight.primary;
            }),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(Palette.bumblebee.primary),
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