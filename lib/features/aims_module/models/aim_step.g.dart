// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AimStep _$AimStepFromJson(Map<String, dynamic> json) => AimStep(
      localId: json['localId'] as int,
      title: json['title'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$AimStepToJson(AimStep instance) => <String, dynamic>{
      'localId': instance.localId,
      'title': instance.title,
      'done': instance.done,
    };
