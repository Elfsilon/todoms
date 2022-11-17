import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class FieldSerializer {
  static int iconToJson(IconData icon) => icon.codePoint;

  static IconData iconFromJson(int codePoint) => IconData(codePoint, fontFamily: 'MaterialIcons');

  static String customColorToJson(CustomColor customColor) => customColor.name;

  static CustomColor customColorFromJson(String colorName) => Palette.getByName(colorName);
}