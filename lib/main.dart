import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoms/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TodomsApp()
    ),
  );
}