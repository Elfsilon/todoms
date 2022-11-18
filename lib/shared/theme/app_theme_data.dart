import 'package:equatable/equatable.dart';
import 'package:todoms/shared/theme/palette.dart';

class AppThemeData extends Equatable{
  const AppThemeData({
    required this.palette,
  });

  final Palette palette;

  @override
  List<Object?> get props => [palette];
}