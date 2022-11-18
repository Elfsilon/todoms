import 'package:flutter/material.dart';
import 'package:todoms/shared/utils/constants/constants.dart';

List<BoxShadow> createBoxShadow(Color color) {
  return [BoxShadow(
    blurRadius: Constants.shadowBlurRange,
    spreadRadius: Constants.shadowSpreadRange,
    color: color,
  )];
}