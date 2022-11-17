import 'package:todoms/shared/utils/constants/runtime_constants.dart';

extension DateTimeUtils on DateTime {
  bool isPast() => difference(RuntimeConstants.today).inDays < 0;
}