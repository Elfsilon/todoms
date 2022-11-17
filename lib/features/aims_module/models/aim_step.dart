import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/shared/interfaces/common.dart';

part 'aim_step.g.dart';

@JsonSerializable()
class AimStep implements Serializable {
  AimStep({
    required this.localId,
    required this.title,
    required this.done,
  });

  final int localId;
  String title;
  bool done;

  AimStep build() => AimStep(
    localId: localId, 
    title: title, 
    done: done, 
  );

  factory AimStep.fromJson(Map<String, dynamic> map) => _$AimStepFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$AimStepToJson(this);
}