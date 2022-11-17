import 'package:flutter_test/flutter_test.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/models/aim_list.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/shared/utils/constants/categories.dart';

AimList createTestData() => AimList([
  Aim(
    id: 0, 
    title: "Test aim", 
    category: Categories.defaultCategories[0],
    deadline: DateTime.now(), 
    done: false, 
    priority: 0, 
    steps: [
      AimStep(localId: 0, title: "step 1", done: false),
    ],
  )
]);

void main() {
  test('aim list add aim', () {
    final updatedList = createTestData().add(
      title: "Test aim 2", 
      category: Categories.defaultCategories[0], 
      deadline: DateTime.now(), 
      priority: 1,
    );
    expect(updatedList.items.length == 2, true);
    expect(updatedList.items[1].id == 1, true);
  });

  test('aim list update aim', () {
    final updatedList = createTestData().update(0,
      title: "Test aim updated", 
      category: Categories.defaultCategories[1], 
    );
    expect(updatedList.items[0].title == "Test aim updated", true);
    expect(updatedList.items[0].category.id == 1, true);
  });

  test('aim list remove aim', () {
    final updatedList = createTestData().delete(0);
    expect(updatedList.items.isEmpty, true);
  });

  test('aim list delete aim step', () {
    final updatedList = createTestData().deleteStep(0, 0);
    expect(updatedList.items[0].steps.isEmpty, true);
  });

  test('aim list add step', () {
    final updatedList = createTestData().addStep(0, title: "step 2");
    expect(updatedList.items[0].steps.length == 2, true);
    expect(updatedList.items[0].steps[1].localId == 1, true);

    final updatedList2 = updatedList.deleteStep(0, 0).addStep(0, title: "step 3");
    expect(updatedList2.items[0].steps.length == 2, true);
    expect(updatedList2.items[0].steps[1].localId == 2, true);
  });

  test('aim list update aim step', () {
    final updatedList = createTestData().updateStep(0, 0, done: true);
    expect(updatedList.items[0].steps[0].done, true);
  });
}