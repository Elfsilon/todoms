import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/models/group.dart';
import 'package:todoms/shared/extensions/date_time_utils.dart';

class GroupList<T extends Groupable> implements Sortable {
  const GroupList(this.items);  

  factory GroupList.from(List<T> list) {
    final mapGroups = <String, List<T>>{};
    for (var element in list) {
      final groupTitle = Group.createTitleFromDeadline(element.deadline);
      if (!mapGroups.containsKey(groupTitle)) {
        mapGroups[groupTitle] = [];
      }
      mapGroups[groupTitle]!.add(element);
    }
    final groups = mapGroups.entries.map((mapGroup) => Group(
      title: mapGroup.key, 
      items: mapGroup.value,
      completed: mapGroup.value[0].deadline.isPast(),
    ));
    return GroupList(groups.toList());
  }

  /// Sort all items by deadline and their subitems by provided sort method
  @override
  void sort() {
    items.sort((groupA, groupB) {
      return groupA.items[0].deadline.compareTo(groupB.items[0].deadline);
    });
    for (var item in items) {
      item.sort();
    }
  }

  final List<Group<T>> items;
}
