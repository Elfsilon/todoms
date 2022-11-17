// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: FieldSerializer.iconFromJson(json['icon'] as int),
      color: FieldSerializer.customColorFromJson(json['color'] as String),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': FieldSerializer.customColorToJson(instance.color),
      'icon': FieldSerializer.iconToJson(instance.icon),
    };
