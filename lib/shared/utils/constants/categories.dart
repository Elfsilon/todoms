import 'package:flutter/material.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

class Categories {
  static const defaultCategories = [
    Category(id: 0, name: "Issue", icon: Icons.bug_report_rounded, color: Palette.lime),
    Category(id: 1, name: "Code", icon: Icons.code_rounded, color: Palette.green),
    Category(id: 2, name: "Self development", icon: Icons.extension_rounded, color: Palette.merigold),
    Category(id: 3, name: "Home", icon: Icons.home_rounded, color: Palette.flameOrange),
    Category(id: 4, name: "Drive", icon: Icons.drive_eta_rounded, color: Palette.lapis),
    Category(id: 5, name: "Family", icon: Icons.favorite_rounded, color: Palette.crimsone),
    Category(id: 6, name: "Study", icon: Icons.school_rounded, color: Palette.amethyst),
    Category(id: 7, name: "Trash", icon: Icons.delete, color: Palette.fgMid),
  ]; 
}