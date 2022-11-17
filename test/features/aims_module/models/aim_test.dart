import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/shared/utils/constants/palette.dart';

final testAim = Aim(
  id: 0, 
  title: "Test aim", 
  category: const Category(
    id: 0, 
    name: "Test category", 
    icon: Icons.lock_clock, 
    color: Palette.azure
  ),
  deadline: DateTime.now(), 
  done: false, 
  priority: 0, 
  steps: [
    AimStep(localId: 0, title: "step 1", done: false),
    AimStep(localId: 1, title: "step 2", done: true),
    AimStep(localId: 2, title: "step 3", done: true),
    AimStep(localId: 3, title: "step 4", done: false),
  ],
);

void main() {
  test('aim serialization', () {
    testAim.toJson();
  });

  test('aim deserialization', () {
    final json = testAim.toJson();
    final deserializedAim = Aim.fromJson(json);

    final json1 = jsonEncode(deserializedAim.toJson());
    final json2 = jsonEncode(json);

    expect(json1 == json2, true);
  });
}