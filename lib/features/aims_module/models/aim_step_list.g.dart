// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_step_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AimStepList _$AimStepListFromJson(Map<String, dynamic> json) => AimStepList(
      (json['items'] as List<dynamic>)
          .map((e) => AimStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AimStepListToJson(AimStepList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
