import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget implements EquatableMixin {
  const AppTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final AppTheme? result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!.data;
  }

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => false;

  @override
  bool updateShouldNotify(AppTheme oldWidget) => this != oldWidget;
}
