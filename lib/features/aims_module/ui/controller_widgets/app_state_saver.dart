import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/models/controller_state.dart';

String encodeState<T extends Serializable>(ControllerState<T> state) {
  final mapState = state.value.toJson();
  final jsonState = jsonEncode(mapState);
  return jsonState;
}

typedef AppStateProvider<T extends Serializable> = StateNotifierProvider<
    StateNotifier<ControllerState<T>>, ControllerState<T>>;

class AppStateSaver<T extends Serializable> extends ConsumerWidget {
  const AppStateSaver({
    super.key,
    required this.child,
    required this.provider,
  });

  final Widget child;
  final AppStateProvider<T> provider;

  void _saveState(ControllerState<T> state) async {
    final jsonState = await compute(encodeState, state);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(state.name, jsonState);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(provider, (_, state) => _saveState(state));
    return child;
  }
}
