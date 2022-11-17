import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/features/aims_module/models/aim.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/shared/interfaces/common.dart';

part 'aim_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AimList implements Serializable {
  AimList(this.items);

  List<Aim> items;

  AimList build() => AimList(items);
  
  factory AimList.fromJson(Map<String, dynamic> map) => _$AimListFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$AimListToJson(this);

  Aim take(int id) {
    return items.firstWhere((aim) => aim.id == id);
  }

  AimStep takeStep(int aimId, int stepId) {
    final aim = items.firstWhere((aim) => aim.id == aimId);
    return aim.steps.firstWhere((step) => step.localId == stepId);
  }

  AimList add({
    required String title,
    required Category category,
    required DateTime deadline,
    required int priority,
  }) {
    return AimList([
      ...items,
      Aim(
        id: _generateAimID(items),
        title: title, 
        category: category, 
        deadline: deadline, 
        priority: priority,
        done: false, 
        steps: []
      )
    ]);
  }

  AimList delete(int id) {
    final updated = items.where((element) => element.id != id).toList();
    return AimList(updated);
  }

  /// Changes `Aim` element by `id` with provided params and returns rebuilded `AimList`
  AimList update(int id, {
    String? title,
    Category? category,
    DateTime? deadline,
    int? priority,
    bool? done,
    bool? important,
  }) {
    final index = _findIndexById(id);

    if (title != null) items[index].title = title;
    if (category != null) items[index].category = category;
    if (deadline != null) items[index].deadline = deadline;
    if (priority != null) items[index].priority = priority;
    if (important != null) items[index].imrotant = important;

    if (done != null) {
      items[index].done = done;
      for (int stepIndex = 0; stepIndex < items[index].steps.length; stepIndex++) {
        items[index].steps[stepIndex].done = done;
      }
    }

    return build();
  }

  AimList addStep(int aimId, {
    required String title,
  }) {
    final aimIndex = _findIndexById(aimId);

    items[aimIndex].steps.add(
      AimStep(
        localId: _generateStepID(items[aimIndex].steps), 
        title: title, 
        done: false,
      )
    );

    return build();
  }

  AimList deleteStep(int aimId, int stepId) {
    final aimIndex = _findIndexById(aimId);

    items[aimIndex].steps = 
      items[aimIndex].steps.where((element) => element.localId != stepId).toList();
    
    return build();
  }

  AimList updateStep(int aimId, int stepId, {
    String? title,
    bool? done,
  }) {
    final aimIndex = _findIndexById(aimId);
    final stepIndex = _findStepIndexById(aimId, stepId);

    if (title != null) items[aimIndex].steps[stepIndex].title = title;
    if (done != null) {
      items[aimIndex].steps[stepIndex].done = done;
      final allStepsDone = items[aimIndex].steps.every((step) => step.done);
      items[aimIndex].done = allStepsDone;
    } 
    
    return build();
  }

  int _findIndexById(int id) => items.indexWhere((element) => element.id == id);

  int _findStepIndexById(int aimId, int stepId) {
    final aimIndex = items.indexWhere((element) => element.id == aimId);
    return items[aimIndex].steps.indexWhere((element) => element.localId == stepId);
  }

  int _generateAimID(List<Aim> list) {
    final maxId = list.fold<int>(0, (prev, element) => element.id > prev ? element.id : prev);
    return maxId + 1;
  }

  int _generateStepID(List<AimStep> list) {
    final maxId = list.fold<int>(0, (prev, element) => element.localId > prev ? element.localId : prev);
    return maxId + 1;
  }

}