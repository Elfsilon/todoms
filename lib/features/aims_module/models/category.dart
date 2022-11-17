import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/shared/interfaces/common.dart';
import 'package:todoms/shared/models/custom_color.dart';
import 'package:todoms/shared/utils/serializer.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category implements Serializable {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  final int id;
  final String name;

  @JsonKey(toJson: FieldSerializer.customColorToJson, fromJson: FieldSerializer.customColorFromJson)
  final CustomColor color;
  
  @JsonKey(toJson: FieldSerializer.iconToJson, fromJson: FieldSerializer.iconFromJson)
  final IconData icon;

  Category build() => Category(
    id: id, 
    name: name,
    icon: icon,
    color: color,
  );

  factory Category.fromJson(Map<String, dynamic> map) => _$CategoryFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}