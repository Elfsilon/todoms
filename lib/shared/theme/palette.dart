import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';

abstract class Palette extends Equatable {
  const Palette();
  
  ColorsScheme get shadow;
  ColorsScheme get foreground;
  ColorsScheme get background;
  CustomColorsScheme get custom;
  GreywashColorsScheme get greywash;

  @override
  List<Object?> get props => [foreground, background, custom];
}

class CustomColorsScheme extends Equatable {
  const CustomColorsScheme({
    required this.greenTea,
    required this.lime,
    required this.green,
    required this.turquoise,
    required this.azure,
    required this.lapis,
    required this.amethyst,
    required this.purple,
    required this.hotPink,
    required this.crimsone,
    required this.roseRed,
    required this.flameOrange,
    required this.merigold,
    required this.bumblebee,
  });

  final CustomColor greenTea; 
  final CustomColor lime; 
  final CustomColor green;
  final CustomColor turquoise; 
  final CustomColor azure; 
  final CustomColor lapis; 
  final CustomColor amethyst;
  final CustomColor purple;
  final CustomColor hotPink;
  final CustomColor crimsone;
  final CustomColor roseRed; 
  final CustomColor flameOrange;
  final CustomColor merigold;
  final CustomColor bumblebee;

  @override
  List<Object?> get props => [greenTea, lime, green, turquoise, azure, lapis, 
    amethyst, purple, hotPink, crimsone, roseRed, flameOrange, merigold, bumblebee];
}

class GreywashColorsScheme extends Equatable {
  const GreywashColorsScheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final CustomColor primary; 
  final CustomColor secondary; 
  final CustomColor tertiary;

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}

class ColorsScheme extends Equatable {
  const ColorsScheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary; 
  final Color secondary;
  final Color tertiary; 

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}
