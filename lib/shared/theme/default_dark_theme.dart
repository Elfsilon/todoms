import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/theme/palette.dart';

class DefaultDarkPalette extends Palette {
  const DefaultDarkPalette({
    this.custom = const CustomColorsScheme(
      greenTea: CustomColor("green_tea", Color(0xFFC6BF16), Color(0x18C6BF16), Color(0x4B91C616)),
      lime: CustomColor("lime", Color(0xFF78C616), Color(0x1878C616), Color(0x4B3FC616)),
      green: CustomColor("green", Color(0xFF2EB75D), Color(0x182EB75D), Color(0x4B2EB730)),
      turquoise: CustomColor("turquoise", Color(0xFF3ED7C4), Color(0x183ED7C4), Color(0x4B3EB6D7)),
      azure: CustomColor("azure", Color(0xFF219FFA), Color(0x18219FFA), Color(0x4B2157FA)),
      lapis: CustomColor("lapis", Color(0xFF3E22EE), Color(0x183E22EE), Color(0x4B224BEE)),
      amethyst: CustomColor("amethyst", Color(0xFF8F00FF), Color(0x188F00FF), Color(0x4B3C00FF)),
      purple: CustomColor("purple", Color(0xFFCC00FF), Color(0x18CC00FF), Color(0x4BFF00DD)),
      hotPink: CustomColor("hot_pink", Color(0xFFFF008A), Color(0x18FF008A), Color(0x4BFF0033)),
      crimsone: CustomColor("crimsone", Color(0xFFFF004D), Color(0x18FF004D), Color(0x4BFF0000)),
      roseRed: CustomColor("rose_red", Color(0xFFFF0000), Color(0x18FF0000), Color(0x4BFF5500)),
      flameOrange: CustomColor("flame_orange", Color(0xFFFF5C00), Color(0x18FF5C00), Color(0x4BFF0900)),
      merigold: CustomColor("merigold", Color(0xFFFFA800), Color(0x18FFA800), Color(0x4BFF5500)),
      bumblebee: CustomColor("bumblebee", Color(0xFFFFE600), Color(0x18FFE600), Color(0x4BFFBB00)),
    ),
    this.greywash = const GreywashColorsScheme(
      primary: CustomColor("fg_middle", Color(0xFF828282)), 
      secondary: CustomColor("fg_middle", Color(0xFF828282)), 
      tertiary: CustomColor("fg_middle", Color(0xFF828282)),
    ),
    this.foreground = const ColorsScheme(
      primary: Color(0xFFF2F2F2), 
      secondary: Color(0xFF828282), 
      tertiary: Color(0xFF292929)
    ),
    this.background = const ColorsScheme(
      primary: Color(0xFF141414), 
      secondary: Color(0xFF191919), 
      tertiary: Color(0xFF1F1F1F)
    ),
    this.shadow = const ColorsScheme(
      primary: Color(0x33000000), 
      secondary: Color(0x18000000), 
      tertiary: Color(0x08000000),
    ),
  });

  @override
  final CustomColorsScheme custom;

  @override
  final GreywashColorsScheme greywash;

  @override
  final ColorsScheme background;

  @override
  final ColorsScheme foreground;

  @override
  final ColorsScheme shadow;
}