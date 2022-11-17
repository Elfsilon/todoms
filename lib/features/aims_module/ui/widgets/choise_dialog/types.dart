import 'package:flutter/material.dart';

typedef CellBuilder<T> = Widget Function(bool selected, T value);
typedef DialogAction<T> = Function(T)?;