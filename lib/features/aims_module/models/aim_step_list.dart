import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/features/aims_module/models/aim_step.dart';
import 'package:todoms/shared/interfaces/common.dart';

part 'aim_step_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AimStepList implements Serializable {
  const AimStepList(this.items);

  final List<AimStep> items;

  factory AimStepList.fromJson(Map<String, dynamic> map) => _$AimStepListFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$AimStepListToJson(this);
}