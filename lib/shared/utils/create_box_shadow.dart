import 'package:flutter/material.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

List<BoxShadow> createBoxShadow(CustomColor color) {
  return [BoxShadow(
    blurRadius: Constants.shadowBlurRange,
    spreadRadius: Constants.shadowSpreadRange,
    color: color.shadow,
  )];
}