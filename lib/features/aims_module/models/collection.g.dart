// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as int,
      title: json['title'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'deadline': instance.deadline.toIso8601String(),
    };
