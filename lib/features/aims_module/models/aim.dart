import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/features/aims_module/models/category.dart';
import 'package:todoms/shared/interfaces/common.dart';

part 'aim.g.dart';

@JsonSerializable(explicitToJson: true)
class Aim implements Groupable, Serializable {
  Aim({
    required this.id,
    required this.title,
    required this.category,
    required this.deadline,
    required this.done,
    required this.priority,
    required this.steps,
    this.imrotant = false,
  });

  @override
  DateTime deadline;

  final int id;
  String title;
  Category category;
  bool done;
  int priority;
  bool? imrotant;
  List<AimStep> steps;

  int get progress {
    if (done) return 100;
    if (steps.isNotEmpty) {
      final doneSteps = steps.fold(0, (acc, el) => el.done ? acc + 1 : acc);
      return (doneSteps / steps.length * 100).toInt();
    } else {
      return 0;
    }
  }

  Aim build() => Aim(
    id: id, 
    title: title, 
    category: category, 
    deadline: deadline, 
    done: done, 
    priority: priority, 
    steps: steps,
  );

  factory Aim.fromJson(Map<String, dynamic> map) => _$AimFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$AimToJson(this);
}