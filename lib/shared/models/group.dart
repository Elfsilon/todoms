import 'package:intl/intl.dart';
import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/utils/converters.dart';

class Group<T extends Groupable> implements Sortable {
  const Group({
    required this.title,
    required this.items,
    required this.completed,
  });

  final String title;
  final List<T> items;
  final bool completed;

  static String createTitleFromDeadline(DateTime deadline) {
    return DateFormat("dd.MM.yyyy").format(deadline);
  }

  @override
  void sort() {
    items.sort((itemA, itemB) {
      // Sort by completion status
      final aCompleted = Converter.boolToInt(itemA.done);
      final bCompleted = Converter.boolToInt(itemB.done);
      final completedComparation = aCompleted - bCompleted;
      if (completedComparation != 0) return completedComparation;

      // Sort by priority
      final priorityComparation = itemB.priority.compareTo(itemA.priority);
      return priorityComparation;
    });
  }
}
