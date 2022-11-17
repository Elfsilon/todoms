// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aim _$AimFromJson(Map<String, dynamic> json) => Aim(
      id: json['id'] as int,
      title: json['title'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      deadline: DateTime.parse(json['deadline'] as String),
      done: json['done'] as bool,
      priority: json['priority'] as int,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => AimStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      imrotant: json['imrotant'] as bool? ?? false,
    );

Map<String, dynamic> _$AimToJson(Aim instance) => <String, dynamic>{
      'deadline': instance.deadline.toIso8601String(),
      'id': instance.id,
      'title': instance.title,
      'category': instance.category.toJson(),
      'done': instance.done,
      'priority': instance.priority,
      'imrotant': instance.imrotant,
      'steps': instance.steps.map((e) => e.toJson()).toList(),
    };
