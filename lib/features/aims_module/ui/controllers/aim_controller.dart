import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/models/aim_list.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/shared/models/controller_state.dart';

final aimControllerProvider = StateNotifierProvider<AimController, ControllerState<AimList>>(
  (ref) => AimController(),
);

final initialValue = ControllerState(
  name: ControllerStateNames.aimsState,
  value: AimList([])
);

class AimController extends StateNotifier<ControllerState<AimList>> {
  AimController(): super(initialValue) { 
    loadState(); 
  }

  void loadState() async {
    state = state.toggleLoader();

    final prefs = await SharedPreferences.getInstance();
    final loadedStateJson = prefs.getString(state.name);
    if (loadedStateJson == null) {
      // TODO: Show error
    } else if (loadedStateJson.isNotEmpty) {
      final loadedState = jsonDecode(loadedStateJson);
      final aims = AimList.fromJson(loadedState);
      state = state.changeValue(aims);
    }

    state = state.toggleLoader();
  }

  Aim take(int id) {
    return state.value.take(id);
  }

  AimStep takeStep(int aimId, int stepId) {
    return state.value.takeStep(aimId, stepId);
  }

  void add({
    required String title,
    required Category category,
    required DateTime deadline,
    required int priority,
  }) {
    final updatedValue = state.value.add(
      title: title, 
      category: category, 
      deadline: deadline, 
      priority: priority
    );
    state = state.changeValue(updatedValue);
  }

  void delete(int id) {
    final updatedValue = state.value.delete(id);
    state = state.changeValue(updatedValue);
  }

  void update(int id, {
    String? title,
    Category? category,
    DateTime? deadline,
    int? priority,
    bool? done,
    bool? important,
  }) {
    final updatedValue = state.value.update(
      id, 
      title: title, 
      priority: priority, 
      category: category, 
      deadline: deadline, 
      done: done,
      important: important,
    );
    state = state.changeValue(updatedValue);
  }

  void addStep(int aimId, {
    required String title,
  }) {
    final updatedValue = state.value.addStep(aimId, title: title);
    state = state.changeValue(updatedValue);
  }

  void deleteStep(int aimId, int stepId) {
    final updatedValue = state.value.deleteStep(aimId, stepId);
    state = state.changeValue(updatedValue);
  }

  void updateStep(int aimId, int stepId, {
    String? title,
    bool? done,
  }) {
    final updatedValue = state.value.updateStep(aimId, stepId, title: title, done: done);
    state = state.changeValue(updatedValue);
  }
}