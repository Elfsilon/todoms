import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';

class Palette {
  static const fgLight = CustomColor("fg_light", Color(0xFFF2F2F2));
  static const fgMid = CustomColor("fg_middle", Color(0xFF828282));
  static const fgDark = CustomColor("fg_dark", Color(0xFF292929));
  static const bgLight = CustomColor("bg_light", Color(0xFF1F1F1F));
  static const bgMid = CustomColor("bg_middle", Color(0xFF191919));
  static const bgDark = CustomColor("bg_dark", Color(0xFF141414));
  static const greenTea = CustomColor("green_tea", Color(0xFFC6BF16), Color(0x18C6BF16), Color(0x4B91C616));
  static const lime = CustomColor("lime", Color(0xFF78C616), Color(0x1878C616), Color(0x4B3FC616));
  static const green = CustomColor("green", Color(0xFF2EB75D), Color(0x182EB75D), Color(0x4B2EB730));
  static const turquoise = CustomColor("turquoise", Color(0xFF3ED7C4), Color(0x183ED7C4), Color(0x4B3EB6D7));
  static const azure = CustomColor("azure", Color(0xFF219FFA), Color(0x18219FFA), Color(0x4B2157FA));
  static const lapis = CustomColor("lapis", Color(0xFF3E22EE), Color(0x183E22EE), Color(0x4B224BEE));
  static const amethyst = CustomColor("amethyst", Color(0xFF8F00FF), Color(0x188F00FF), Color(0x4B3C00FF));
  static const purple = CustomColor("purple", Color(0xFFCC00FF), Color(0x18CC00FF), Color(0x4BFF00DD));
  static const hotPink = CustomColor("hot_pink", Color(0xFFFF008A), Color(0x18FF008A), Color(0x4BFF0033));
  static const crimsone = CustomColor("crimsone", Color(0xFFFF004D), Color(0x18FF004D), Color(0x4BFF0000));
  static const roseRed = CustomColor("rose_red", Color(0xFFFF0000), Color(0x18FF0000), Color(0x4BFF5500));
  static const flameOrange = CustomColor("flame_orange", Color(0xFFFF5C00), Color(0x18FF5C00), Color(0x4BFF0900));
  static const merigold = CustomColor("merigold", Color(0xFFFFA800), Color(0x18FFA800), Color(0x4BFF5500));
  static const bumblebee = CustomColor("bumblebee", Color(0xFFFFE600), Color(0x18FFE600), Color(0x4BFFBB00));
  
  static CustomColor getByName(String name) {
    switch (name) {
      case "fg_light": return fgLight;
      case "fg_middle": return fgMid;
      case "fg_dark": return fgDark;
      case "bg_light": return bgLight;
      case "bg_middle": return bgMid;
      case "bg_dark": return bgDark;
      case "green_tea": return greenTea;
      case "lime": return lime;
      case "green": return green;
      case "turquoise": return turquoise;
      case "azure": return azure;
      case "lapis": return lapis;
      case "amethyst": return amethyst;
      case "purple": return purple;
      case "hot_pink": return hotPink;
      case "crimsone": return crimsone;
      case "rose_red": return roseRed;
      case "flame_orange": return flameOrange;
      case "merigold": return merigold;
    }
    return fgLight;
  }
}