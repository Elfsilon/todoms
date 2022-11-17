import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/models/controller_state.dart';

typedef AppStateProvider<T extends Serializable> 
  = StateNotifierProvider<StateNotifier<ControllerState<T>>, ControllerState<T>>;

class AppStateSaver<T extends Serializable> extends ConsumerWidget {
  const AppStateSaver({
    super.key,
    required this.child,
    required this.provider,
  });

  final Widget child;
  final AppStateProvider<T> provider;

  void _saveState(ControllerState<T> state) async {
    final mapState = state.value.toJson();
    final jsonState = jsonEncode(mapState);
    
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(state.name, jsonState);

    final test = prefs.getString(state.name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(provider, (_, state) => _saveState(state));
    return child;
  }
}
